from django.db import models
from datetime import datetime
from django.contrib.auth.models import AbstractUser
from django.db import models

class CustomUser(AbstractUser):
    class Role(models.TextChoices):
        MEMBER = 'member', 'Member'
        LIBRARIAN = 'librarian', 'Librarian'

    role = models.CharField(
        max_length=20,
        choices=Role.choices,
        default=Role.MEMBER,
    )

# Create your models here.
class CategoryBook(models.Model):
    namaCategory = models.CharField(max_length=30)

    def __str__(self):
        return self.namaCategory

class Book(models.Model):
    judul = models.CharField(max_length=255)
    penerbit = models.CharField(max_length=255)
    penulis = models.CharField(null=True ,max_length=255)
    tahun_terbit = models.IntegerField(null=True)
    categorybook = models.ForeignKey(CategoryBook, null=True,on_delete=models.CASCADE, default=None)
    cover = models.ImageField(upload_to='cover/', null= True)
    def __str__(self):
        return self.judul
  

# class AuthUser(models.Model):
#     class Role(models.TextChoices):
#         OPTION1 = 'librarian', 'librarian'
#         OPTION2 = 'member', 'member'

#     password = models.CharField(max_length=128)
#     last_login = models.DateTimeField(blank=True, null=True)
#     is_superuser = models.IntegerField()
#     username = models.CharField(unique=True, max_length=150)
#     first_name = models.CharField(max_length=150)
#     last_name = models.CharField(max_length=150)
#     email = models.CharField(max_length=254)
#     is_staff = models.IntegerField()
#     is_active = models.IntegerField()
#     date_joined = models.DateTimeField()
#     role = models.CharField(
#         max_length=10,
#         choices=Role.choices,
#         default=Role.OPTION2,
#     )

#     class Meta:
#         managed = False
#         db_table = 'auth_user'

class Peminjaman(models.Model):
    member = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    buku = models.ForeignKey(Book, on_delete=models.CASCADE)
    tanggal_pinjam = models.DateField(auto_now_add = True)
    tanggal_kembali = models.DateField(null=True, blank=True)
    tanggal_pengembalian = models.DateField(null=True)
    status = models.BooleanField(default=False)
    
    
    def __str__(self):
        return f"{self.member.username} - {self.buku.judul}"
 
class LoginHistory(models.Model):
    user = models.ForeignKey(CustomUser, on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    successful = models.BooleanField()

    def __str__(self):
        return f"{self.user.username} - {'Success' if self.successful else 'Failure'}"