from django.contrib.auth.backends import ModelBackend
from django.contrib.auth import get_user_model
from .models import User

class TokenAuthenticationBackend(ModelBackend):
       def authenticate(self, request, email=None, password=None, **kwargs):
        print(f"Authenticating user with email: {email}")

        try:
            user = get_user_model().objects.get(email__iexact=email)
        except get_user_model().DoesNotExist:
            print(f"User not found for email: {email}")
            return None

        if user.check_password(password):
            print(f"User authenticated: {user}")
            return user

        print(f"Invalid password for user: {user}")
        return None
