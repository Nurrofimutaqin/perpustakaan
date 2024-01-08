from book.models import *
from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from datetime import date

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = CategoryBook
        fields = '__all__'

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = '__all__'

class BookLoanSerializer(serializers.ModelSerializer):
    class Meta:
        model = Peminjaman
        fields = '__all__'

class BookLoanUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Peminjaman
        fields = ['buku', 'tanggal_kembali']

class OverDueSerializer(serializers.ModelSerializer):
    days_overdue = serializers.SerializerMethodField()
    class Meta:
        model = Peminjaman
        fields = '__all__'

    def get_days_overdue(self, obj):
        if obj.tanggal_kembali and obj.tanggal_kembali < date.today() and not obj.status:
            return (date.today() - obj.tanggal_kembali).days
        return 0
    
class NearOverDueSerializer(serializers.ModelSerializer):
    sisa_waktu = serializers.SerializerMethodField()
    class Meta:
        model = Peminjaman
        fields = '__all__'

    def get_sisa_waktu(self, obj):
        if obj.tanggal_kembali and obj.tanggal_kembali > date.today() and not obj.status:
            return str(( obj.tanggal_kembali - date.today()).days) + ' days'
        return 0

    
# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = CustomUser
#         fields = ['id','username', 'email', 'first_name', 'last_name']

class CustomUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['username','password', 'role']
        extra_kwargs = {"password": {"write_only": True}}

class UserSerializer(ModelSerializer):
     
    class Meta:
        model = CustomUser
        fields = ["username", "password"]
        extra_kwargs = {"password": {"write_only": True}}
     
    def create(self, validated_data):
        user = CustomUser(username=validated_data["username"])
        user.set_password(validated_data["password"])
        user.save()
        return user


class ChangePasswordSerializer(serializers.Serializer):
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)


class MemberProfileUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['first_name', 'last_name', 'email', 'username']