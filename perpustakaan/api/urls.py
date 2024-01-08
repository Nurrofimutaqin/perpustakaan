from django.urls import path
from api import views
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)

urlpatterns = [
    path('books/', views.BookList.as_view()),
    path('books/<int:pk>/', views.BookDetail.as_view()),
    path('categorys/', views.CategoryList.as_view()),
    path('categorys/<int:pk>/', views.CategoryDetail.as_view()),
    path('book-loans/', views.BookLoanList.as_view()),
    path('book-loans/<int:pk>/', views.BookLoanDetail.as_view()),
    path('users/', views.UserList.as_view()),
    # path('users/<int:pk>/', views.UserDetail.as_view()),
    path('book-loans/near-overdue/', views.NearOverdueViewSet.as_view({'get': 'list'})),
    path('book-loans/overdue/', views.OverdueViewSet.as_view({'get': 'list'})),

    #pakai rest framework aja dan simplejwt
    path('token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify                                                                                '),
    path('filter-book/judul/', views.BookListFilterByJudul.as_view(), name='filter-book-judul'),
    path('filter-book/category_year/', views.BookFilterByCategory_Year.as_view(), name='filter-book'),
    #registrasi 
    path('registration/', views.RegistUser.as_view()),

    #login untuk member dan librarian
    path('login/member/', views.LoginToMember.as_view()),
    path('login/librarian/', views.LoginToLibrarian.as_view()),
    #logout
    path('logout/member/', views.LogoutMemberView.as_view(), name='logout-member'),
    path('logout/librarian/', views.LogoutLibrarianView.as_view(), name='logout-librarian'),
    #change password
    path('change-password/member/', views.ChangePasswordMemberView.as_view(), name='change-password-member'),
    path('change-password/librarian/', views.ChangePasswordLibrarianView.as_view(), name='change-password-librarian'),
    #change data
    path('change-data/member/', views.MemberProfileUpdateView.as_view(), name='change-data-member'),





     #pakai rest framework aja dan tidak dipakai
    path('member/login/', views.MemberLoginView.as_view(), name='member-login'),
    path('member/profile/', views.MemberProfileView.as_view(), name='member-profile'),


    path('member/book-loans/', views.BookLoansUser.as_view(), name='member-book-loans'),
]
                                                                        
urlpatterns = format_suffix_patterns(urlpatterns)