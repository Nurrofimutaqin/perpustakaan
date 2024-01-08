from django.contrib.auth.signals import user_logged_in, user_logged_out, user_login_failed
from django.dispatch import receiver
from .models import LoginHistory

@receiver(user_logged_in)
def user_logged_in_callback(sender, request, user, **kwargs):
    LoginHistory.objects.create(user=user, successful=True)


