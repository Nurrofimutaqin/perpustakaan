from django.urls import path 
from . import views
from .views import *


urlpatterns =[
    path('', views.home, name='home'),
    path('books/', BookList.as_view(), name='book-list'),
    path('books/create', BookCreateView.as_view(), name='book-create'),
    path('books/edit/<int:pk>/', BooksUpdateView.as_view(), name='books-update'),
    path('books/delete/<int:id>/', views.deleteBook, name='deletebook'),
    path('books/detail/<int:pk>/', BookDetail.as_view(), name='books-detail'),

    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),


    path('peminjaman/', views.datapeminjaman, name='datapeminjaman'),
    path('peminjaman/create/', views.createpeminjaman, name='createpeminjaman'),
    path('peminjaman/delete/<int:id>/', views.deletepeminjaman, name='deletepeminjaman'),
    path('peminjaman/edit/<int:id>/', views.updatepeminjaman, name='updatepeminjaman'),
    path('peminjaman/reportdeadline', views.report_deadline, name='reportdeadline'),
    path('peminjaman/hampirdeadline', views.report_hampir_deadline, name='hampirdeadline'),

    path('user/', views.datauser, name='datauser'),
    path('signup/', views.signup, name='signup'),
    path('user/create/', views.createuser, name='createuser'),
    path('user/delete/<int:id>/', views.deleteuser, name='deleteuser'),
    path('loginhistory/', views.login_history, name='history'),
    path('user/edit/<int:pk>/', UserUpdateView.as_view(), name='updateuser'),
    path('update_password/', views.update_password, name='update_password'),

    
    path('categorys/', CategoryBookList.as_view(), name='category-list'),
    path('categorys/create', CategoryCreateView.as_view(), name='category-create'),
    path('categorys/edit/<int:pk>/', CategoryUpdateView.as_view(), name='category-update'),
    path('categorys/delete/<int:pk>/', CategoryDeleteView.as_view(), name='category-delete'),
    path('book-loan/by-user/', PeminjamanCreateView.as_view(), name='loans-by-user'),
    path('list-book-loans/by-user/', ListPeminjamanByUser.as_view(), name='list-loan-user'),

    ]

