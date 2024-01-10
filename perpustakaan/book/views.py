from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from .models import *
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.conf import settings
from datetime import date, timedelta
from django.db.models import F, ExpressionWrapper, fields
from django.utils import timezone
from django.contrib.auth import update_session_auth_hash
from .forms import *
from django.views.generic import *
from django.utils.decorators import method_decorator
from django.contrib.auth import get_user_model


#decorator untuk permision hanya role librarian saja yang diperbolehkan
def librarian_required(view_func):
    actual_decorator = user_passes_test(
        lambda customuser: customuser.role == 'librarian',
        login_url='/',  # Ganti dengan URL login yang sesuai
    )
    return actual_decorator(view_func)


# Create your views here.
#untuk home
def home(request):
    return render(request, 'home.html')

#untuk Crud Buku
@method_decorator(login_required, name='dispatch')
class BookList(ListView):
    model = Book
    template_name = 'buku/databuku.html'
    context_object_name = 'buku'

@method_decorator(login_required, name='dispatch')
class BookDetail(DetailView):
    model = Book
    template_name = 'buku/detailbuku.html'
    context_object_name = 'buku'

@method_decorator(login_required, name='dispatch')
class BookCreateView(View):
    template_name = 'buku/tambahbuku.html'

    def get(self, request):
        form = formBook()
        categorys = CategoryBook.objects.all()
        return render(request, self.template_name, {'categorys': categorys, 'form': form})

    def post(self, request):
        form = formBook(request.POST, request.FILES)
        form.save()
        messages.success(request, 'Berhasil Input Data Buku')
        return redirect('book-list')



##untuk peminjaman buku berdasarkan user yang sedang login
@method_decorator(login_required, name='dispatch')
class PeminjamanCreateView(View):
    template_name = 'peminjaman/tambah_peminjaman_by_user.html'

    def get(self, request):
        form = PeminjamanForm()
        book = Book.objects.all()
        return render(request, self.template_name, {'form': form, 'book': book})
    def post(self, request):
        form = PeminjamanForm(request.POST)
        if form.is_valid():
            peminjaman = form.save(commit=False)
            peminjaman.member = request.user
            peminjaman.save()
            messages.success(request, 'Berhasil Input Data peminjaman')
            return redirect('list-loan-user')
        return render(request, self.template_name, {'form': form})

@method_decorator(login_required, name='dispatch')
class ListPeminjamanByUser(View):
    template_name = 'peminjaman/list_peminjaman_user.html'
    def get(self, request):
        peminjaman = Peminjaman.objects.filter(member = request.user )
        return render(request, self.template_name, { 'peminjaman': peminjaman})

class LoanBookFromBook(View):
    template_name = 'buku/peminjaman.html'
    def get(self, request, pk):
        book = get_object_or_404(Book, pk=pk)
        form = PeminjamanForm()
        return render(request, self.template_name, {'book': book, 'form':form})
    def post(self, request, pk):
        buku = Book.objects.get(pk=pk)
        form = PeminjamanForm(request.POST)
        
        if form.is_valid():
            peminjaman = form.save(commit=False)
            peminjaman.buku = buku
            peminjaman.member = request.user
            peminjaman.save()

            messages.success(request, 'Berhasil Input Data peminjaman')
            return redirect('list-loan-user')  # Ganti dengan URL halaman sukses peminjaman

        return render(request, self.template_name, {'form': form, 'buku': buku})
@method_decorator(login_required, name='dispatch')
class BooksUpdateView(UpdateView):
    template_name = 'buku/editbuku.html'
    def get(self, request, pk):
        books = get_object_or_404(Book, pk=pk)
        categorys = CategoryBook.objects.all()
        form = formBook(instance=books)
        return render(request, self.template_name, {'books': books, 'categorys': categorys, 'form': form})
    def post(self, request, pk):
        book = get_object_or_404(Book, pk=pk)
        form = formBook(request.POST or None, request.FILES or None, instance=book)
        if form.is_valid():
            if book.cover and form.cleaned_data['cover'] != book.cover:
                book.cover.delete(save=False)
            
            new_instance = form.save(commit=False)
            new_instance.save()

        # Redirect ke halaman setelah berhasil mengupdate data
            messages.success(request, 'berhasil edit data member')
            return redirect('book-list')
        else:
            messages.success(request, 'Gagal edit data member')
            return redirect('book-list')

@login_required(login_url=settings.LOGIN_URL)
def deleteBook(request, id):

    book = Book.objects.get(id=id)
    book.cover.delete(save=False)
    book.delete()
    messages.success(request, 'berhasil menghapus data buku')
    return redirect('book-list')


# untuk Crud peminjaman
@login_required(login_url=settings.LOGIN_URL)
def datapeminjaman(request):
    peminjaman = Peminjaman.objects.all()
    context = {
        'peminjaman' : peminjaman,
    }
    return render(request, 'peminjaman/datapeminjaman.html', context)



@login_required
def createpeminjaman(request):
    # peminjaman = Peminjaman.objects.all()
    member = CustomUser.objects.all()
    buku = Book.objects.all()
    context = {
        'member' : member,
        'buku' : buku
    }
    if request.POST:
        tanggal_kembali = request.POST['tanggal_kembali']
        buku_id = request.POST['buku_id']
        member_id = request.POST['member_id']
        peminjaman = Peminjaman(tanggal_kembali=tanggal_kembali, buku_id=buku_id, member_id=member_id)
        peminjaman.save()
        messages.success(request, 'berhasil menambahkan data peminjaman')
        return redirect('/peminjaman')
    return render(request, 'peminjaman/addpeminjaman.html', context)

@login_required(login_url=settings.LOGIN_URL)
def deletepeminjaman(request, id):
    peminjaman = Peminjaman.objects.get(id=id)
    peminjaman.delete()
    messages.success(request, 'berhasil menghapus data peminjaman')
    return redirect('/peminjaman')


@login_required(login_url=settings.LOGIN_URL)
def updatepeminjaman(request, id ):
    peminjaman = Peminjaman.objects.get(id=id)
    member = CustomUser.objects.all()
    buku = Book.objects.all()
    if peminjaman.tanggal_kembali:
        tanggal_kembali = peminjaman.tanggal_kembali.strftime('%Y-%m-%d')
    if peminjaman.tanggal_pengembalian:
        tanggal_pengembalian = peminjaman.tanggal_pengembalian.strftime('%Y-%m-%d')
    else:
        tanggal_pengembalian = None
    context = {
        'peminjaman' : peminjaman,
        'member' : member,
        'buku' : buku,
        'tanggal_kembali' : tanggal_kembali,
        'tanggal_pengembalian' : tanggal_pengembalian
    }
    if request.POST:
        peminjaman.tanggal_kembali = request.POST['tanggal_kembali']
        peminjaman.buku_id = request.POST['buku_id']
        peminjaman.member_id = request.POST['member_id']
        tanggal_pengembalian_input = request.POST.get('tanggal_pengembalian')
        if tanggal_pengembalian_input:
            your_date = request.POST['tanggal_pengembalian']
        else:
            your_date = None
        peminjaman.tanggal_pengembalian = your_date
        peminjaman.status = request.POST.get('status') == 'true'
        peminjaman.save()
        messages.success(request, 'berhasil edit data peminjaman')
        return redirect('/peminjaman')
    else: 
        return render(request, 'peminjaman/editpeminjaman.html', context)
    

@login_required(login_url=settings.LOGIN_URL)
def report_deadline(request):
    peminjaman_lewat_tenggat = Peminjaman.objects.filter(tanggal_kembali__lte=date.today(), status=False)
    
    deadline = peminjaman_lewat_tenggat.annotate(
        dead=ExpressionWrapper(
            F('tanggal_kembali') - date.today(),
            output_field=fields.DurationField()
        )
    )
    for loan in deadline:
        loan.dead = abs(loan.dead.days)

    context = {
        'deadline' : deadline,
    }
    return render(request, 'peminjaman/laporan_lewat_deadline.html', context)

@login_required(login_url=settings.LOGIN_URL)
def report_hampir_deadline(request):
    tomorow = date.today() + timedelta(days=1)
    batas_waktu_hampir_lewat = tomorow + timedelta(days=2)
    hampir_tenggat = Peminjaman.objects.filter(tanggal_kembali__gte=tomorow, tanggal_kembali__lte=batas_waktu_hampir_lewat, status=False)


        # Hitung selisih waktu pengembalian dengan waktu sekarang
    overdue_books = hampir_tenggat.annotate(
        time_difference=ExpressionWrapper(
            F('tanggal_kembali') - date.today(),
            output_field=fields.DurationField()
        )
    )

    context = {
        'hampir' : overdue_books,
    }
    return render(request, 'peminjaman/laporan_hampir_deadline.html', context)


#untuk Crud user
@method_decorator(login_required, name='dispatch')
@method_decorator(librarian_required, name='dispatch')
class ListUser(ListView):
    model = CustomUser
    template_name = 'user/datauser.html'
    context_object_name = 'user'

@librarian_required
def createuser(request):
    if request.POST:
        form = CreateUser(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'berhasil menambahkan data user')
            return redirect('datauser')
        else:
            messages.error(request, 'gagal menambahkan data user')
            return redirect('datauser')

    else:
        user = CreateUser()
        return render(request, 'user/adduser.html', {'form' : user})

@login_required(login_url=settings.LOGIN_URL)
def deleteuser(request, id):
    user = CustomUser.objects.get(id=id)
    user.delete()
    messages.success(request, 'data user berhasil dihapus')
    return redirect('datauser')

#buat akun user dari sign up page
def signup(request):
    if request.POST:
        form = formregist(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'user berhassil membuat user')
            return redirect('login')
        else:
            messages.success(request, 'user gagal dibuat')
            return redirect('signup')
    else:
        form = formregist()
    return render(request, 'registration/signup.html', {'form' : form})


#fungsi untuk login dan logout
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, 'username atau password salah')
            return redirect('/login')
    return render( request, 'registration/login.html')


def logout_view(request):
    logout(request)
    request.session.flush()
    return redirect('/login')

@login_required(login_url=settings.LOGIN_URL)
def login_history(request):
    history = LoginHistory.objects.all()
    context = {
        'history' : history,
    }
    return render(request, 'registration/login_history.html', context)

# edit user dari admin page
@method_decorator(login_required, name='dispatch')
@method_decorator(librarian_required, name='dispatch')  
class UserUpdateView(UpdateView):
    model = CustomUser
    form_class = UpdateUserForm
    context_object_name = 'user'
    template_name = 'user/edituser.html'
    success_url = reverse_lazy('datauser')

@login_required
def update_password(request):
    if request.method == 'POST':
        current_password = request.POST.get('password')
        new_password = request.POST.get('new_password')
        confirm_new_password = request.POST.get('confirm_new_password')

        # Autentikasi pengguna dengan password saat ini
        user = authenticate(username=request.user.username, password=current_password)

        if user is not None:
            # Ubah password jika konfirmasi password baru cocok
            if new_password == confirm_new_password:
                user.set_password(new_password)
                user.save()

                # Perbarui sesi autentikasi
                update_session_auth_hash(request, user)

                messages.success(request, 'Password updated successfully.')
                return redirect('update_password')  # Ganti 'profile' dengan nama URL halaman profil Anda
            else:
                messages.error(request, 'New passwords do not match.')
        else:
            messages.error(request, 'Current password is incorrect.')

    return render(request, 'registration/edit_password.html')

@method_decorator(login_required, name='dispatch')
class CategoryBookList(ListView):
    model = CategoryBook
    template_name = 'category/datacategory.html'
    context_object_name = 'category'

@method_decorator(login_required, name='dispatch')
@method_decorator(librarian_required, name='dispatch')
class CategoryCreateView(CreateView):
    model = CategoryBook
    form_class = formCategory
    template_name = 'category/addcategory.html'
    success_url = reverse_lazy('category-list')

@method_decorator(login_required, name='dispatch')
@method_decorator(librarian_required, name='dispatch')
class CategoryUpdateView(UpdateView):
    model = CategoryBook
    form_class = formCategory
    context_object_name = 'category'
    template_name = 'category/editcategory.html'
    success_url = reverse_lazy('category-list')

@method_decorator(login_required, name='dispatch')
@method_decorator(librarian_required, name='dispatch')
class CategoryDeleteView(DeleteView):
    model = CategoryBook
    context_object_name = 'category'
    template_name = 'category/deletecategory.html'
    success_url = reverse_lazy('category-list')