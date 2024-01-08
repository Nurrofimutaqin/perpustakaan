# from django.http import HttpResponse, JsonResponse
# from django.views.decorators.csrf import csrf_exempt
# from rest_framework.decorators import api_view
# from rest_framework.parsers import JSONParser
# from rest_framework import status
from book.models import *
from api.serializers import *
from rest_framework.response import Response
from rest_framework import generics, viewsets
# from django.contrib.auth.decorators import login_required
# from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from rest_framework.pagination import PageNumberPagination
from datetime import date, timedelta
from django.contrib.auth import get_user_model
from rest_framework import status, filters
from rest_framework.views import APIView
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from .serializers import CustomUserSerializer
from rest_framework.generics import ListAPIView
from rest_framework.filters import SearchFilter
from rest_framework.permissions import IsAuthenticated
from django_filters.rest_framework import DjangoFilterBackend
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken

class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1
    page_size_query_param = 'page_size'


class BookList(generics.ListCreateAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    pagination_class = LargeResultsSetPagination
    permission_classes = [IsAuthenticated]


##register
class RegistUser(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer

class BookDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer

class CategoryList(generics.ListCreateAPIView):
    queryset = CategoryBook.objects.all()
    serializer_class = CategorySerializer

class CategoryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = CategoryBook.objects.all()
    serializer_class = CategorySerializer

class BookLoanList(generics.ListCreateAPIView):
    queryset = Peminjaman.objects.all()
    serializer_class = BookLoanSerializer
    pagination_class = LargeResultsSetPagination


class BookLoanDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Peminjaman.objects.all()
    serializer_class = BookLoanSerializer

# class MemberList(generics.ListCreateAPIView):
#     queryset = Member.objects.all()
#     serializer_class = MemberSerializer

# class MemberDetail(generics.RetrieveUpdateDestroyAPIView):
#     queryset = Member.objects.all()
#     serializer_class = MemberSerializer

class UserList(generics.ListCreateAPIView):
    queryset = CustomUser.objects.all()
    serializer_class = UserSerializer

# class UserDetail(generics.RetrieveUpdateDestroyAPIView):
#     queryset = get_user_model()
#     serializer_class = UserSerializer

class NearOverdueViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = BookLoanSerializer
    pagination_class = LargeResultsSetPagination
    def get_queryset(self):
        # Ambil data peminjaman buku yang hampir deadline (misalnya, 3 hari lagi)
        tomorow = date.today() + timedelta(days=1)
        deadline = tomorow + timedelta(days=3)
        queryset = Peminjaman.objects.filter(tanggal_kembali__gte=tomorow, tanggal_kembali__lte=deadline, status=False)
        
        return queryset
    
class OverdueViewSet(viewsets.ReadOnlyModelViewSet):
    serializer_class = BookLoanSerializer
    pagination_class = LargeResultsSetPagination
    def get_queryset(self):
        overdue = Peminjaman.objects.filter(tanggal_kembali__lte=date.today(), status=False)
        return overdue
    
class MemberLoginView(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data, context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        if user.role == 'member':
            token, created = Token.objects.get_or_create(user=user)
            return Response({'token': token.key})
        else:
            return Response({'error': 'Invalid role'}, status=status.HTTP_401_UNAUTHORIZED)

class MemberProfileView(APIView):
    def get(self, request, *args, **kwargs):
        customuser = request.customuser
        if customuser.role == 'member':
            serializer = CustomUserSerializer(customuser)
            return Response(serializer.data)
        else:
            return Response({'error': 'Invalid role'}, status=status.HTTP_401_UNAUTHORIZED)
    
class BookListFilterByJudul(ListAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    filter_backends = [filters.SearchFilter]
    search_fields = ['judul']

class BookFilterByCategory_Year(generics.ListAPIView):
    queryset = Book.objects.all()
    serializer_class = BookSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['categorybook__namaCategory', 'tahun_terbit']
    


#login untuk memver
class LoginToMember(APIView):
    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')

        user = authenticate(username=username, password=password)
        #pengecakan jika username dengan pasword ada? dan dengan role member
        if user is not None and user.role == 'member':
            refresh = RefreshToken.for_user(user)
            serializer = CustomUserSerializer(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': serializer.data
            }, status=status.HTTP_200_OK)
        
        #pengecakan jika username dengan pasword ada? dan dengan role librarian
        elif user is not None and user.role == 'librarian':
            return Response({'detail': 'Invalid role'}, status=status.HTTP_401_UNAUTHORIZED)
    
        else:
            return Response({'detail': 'Invalid Username and Password'}, status=status.HTTP_401_UNAUTHORIZED)

#login untuk librarian  
class LoginToLibrarian(APIView):
    def post(self, request, *args, **kwargs):
        username = request.data.get('username')
        password = request.data.get('password')

        user = authenticate(username=username, password=password)

        if user is not None and user.role == 'librarian':
            refresh = RefreshToken.for_user(user)
            serializer = CustomUserSerializer(user)
            return Response({
                'refresh': str(refresh),
                'access': str(refresh.access_token),
                'user': serializer.data
            }, status=status.HTTP_200_OK)
        elif user is not None and user.role == 'member':
            return Response({'detail': 'Invalid role'}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'detail': 'Invalid Username and Password'}, status=status.HTTP_401_UNAUTHORIZED)
        
class LogoutMemberView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            if request.user.role != 'member':
                return Response({'detail': 'Anda tidak memiliki izin untuk logout'}, status=status.HTTP_403_FORBIDDEN)
            # Hapus token akses
            refresh_token = request.data.get('refresh')
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response({'detail': 'Logout berhasil'}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'detail': str(e)}, status=status.HTTP_400_BAD_REQUEST)
        
class LogoutLibrarianView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            if request.user.role != 'librarian':
                return Response({'detail': 'Anda tidak memiliki izin untuk logout'}, status=status.HTTP_403_FORBIDDEN)
            # Hapus token akses
            refresh_token = request.data.get('refresh')
            token = RefreshToken(refresh_token)
            token.blacklist()

            return Response({'detail': 'Logout berhasil'}, status=status.HTTP_200_OK)
        except Exception as e:
            return Response({'detail': str(e)}, status=status.HTTP_400_BAD_REQUEST)

class ChangePasswordMemberView(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = request.user

        # Verifikasi peran pengguna
        if user.role != 'member':
            return Response({'detail': 'Anda tidak memiliki izin untuk mengganti kata sandi.'}, status=status.HTTP_403_FORBIDDEN)

        old_password = serializer.validated_data['old_password']
        new_password = serializer.validated_data['new_password']

        # Validasi kata sandi lama
        if not user.check_password(old_password):
            return Response({'detail': 'Kata sandi lama tidak valid.'}, status=status.HTTP_400_BAD_REQUEST)

        # Ubah kata sandi
        user.set_password(new_password)
        user.save()

        # Matikan token akses yang lama
        refresh = RefreshToken.for_user(user)
        refresh.blacklist()

        return Response({'detail': 'Kata sandi berhasil diubah.'}, status=status.HTTP_200_OK)
    
class ChangePasswordLibrarianView(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        serializer = ChangePasswordSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        user = request.user

        # Verifikasi peran pengguna
        if user.role != 'librarian':
            return Response({'detail': 'Anda tidak memiliki izin untuk mengganti kata sandi.'}, status=status.HTTP_403_FORBIDDEN)

        old_password = serializer.validated_data['old_password']
        new_password = serializer.validated_data['new_password']

        # Validasi kata sandi lama
        if not user.check_password(old_password):
            return Response({'detail': 'Kata sandi lama tidak valid.'}, status=status.HTTP_400_BAD_REQUEST)

        # Ubah kata sandi
        user.set_password(new_password)
        user.save()

        # Matikan token akses yang lama
        refresh = RefreshToken.for_user(user)
        refresh.blacklist()

        return Response({'detail': 'Kata sandi berhasil diubah.'}, status=status.HTTP_200_OK)
    


class MemberProfileUpdateView(APIView):
    permission_classes = (IsAuthenticated,)

    def put(self, request):
        user = request.user

        # Pemeriksaan peran untuk memastikan hanya role 'member' yang dapat mengubah profil
        if user.role != 'member':
            return Response({'detail': 'Anda tidak memiliki izin untuk mengubah data.'}, status=status.HTTP_403_FORBIDDEN)

        serializer = MemberProfileUpdateSerializer(user, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
