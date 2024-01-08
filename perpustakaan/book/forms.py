from django.forms import ModelForm
from django import forms
from .models import *
from django.contrib.auth.forms import PasswordChangeForm, UserChangeForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm

class formBook(ModelForm):
    class Meta:
        model = Book
        fields = '__all__'
        # widgets = {
            
        #     'cover' : forms.TextInput({'class' : 'form-control', 'type': 'file'}),
        # }

class formLoan(forms.ModelForm):
    book = forms.ModelChoiceField(queryset = Book.objects.all(), label= 'book')
    member = forms.ModelChoiceField(queryset = CustomUser.objects.all(), label= 'member')
    class Meta:
        model = Peminjaman
        fields = ['book', 'member', 'tanggal_kembali']



class formCategory(ModelForm):
    class Meta:
        model = CategoryBook
        fields = '__all__'
        
# class CustomUserChangeForm(UserChangeForm):
#     class Meta:
#         model = CustomUser
#         fields = ['username']

# class ChangePasswordAndUsernameForm(PasswordChangeForm, CustomUserChangeForm):
#     pass


#form untuk registrasi
class formregist(UserCreationForm):
    username = forms.CharField(max_length=150, required=True)

    
    class Meta:
        model = CustomUser
        fields = ['username','email','password1','password2']
        # UserCreationForm.Meta.fields

    def clean_username(self):
        username = self.cleaned_data['username']
        if ' ' in username:
            raise forms.ValidationError("Username tidak boleh mengandung spasi.")
        return username
    

#form untuk create user kusus librarian
class CreateUser(UserCreationForm):
    username = forms.CharField(max_length=150, required=True)

    
    class Meta:
        model = CustomUser
        fields = ['username','email','password1','password2','role']
        # UserCreationForm.Meta.fields

    def clean_username(self):
        username = self.cleaned_data['username']
        if ' ' in username:
            raise forms.ValidationError("Username tidak boleh mengandung spasi.")
        return username