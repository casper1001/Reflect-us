from django.db import models
from rest_framework.views import APIView
from rest_framework.authentication import authenticate
from rest_framework.response import Response
from django.contrib.auth.models import AbstractBaseUser, Group, PermissionsMixin,Permission,BaseUserManager
from django.contrib.auth.backends import ModelBackend


import tensorflow as tf
from keras.models import load_model
import os
import cv2
import numpy as np


class Avatar(models.Model):
    avatar_id = models.AutoField(primary_key=True)
    avatar_name = models.CharField(max_length=255, unique=True)

    def __str__(self):
        return self.avatar_name




class CustomUserManager(BaseUserManager):
    def create_user(self, email, username, password=None, **extra_fields):
        if not email:
            raise ValueError('The Email field must be set')
        email = self.normalize_email(email)
        user = self.model(email=email, username=username, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, username, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, username, password, **extra_fields)


class User(AbstractBaseUser, PermissionsMixin):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=255, unique=True)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    re_password = models.CharField(max_length=255)
    points = models.IntegerField(default=100)
    avatar = models.ForeignKey(Avatar, on_delete=models.CASCADE, null=True, blank=True)
    is_active = models.BooleanField(default=True) 
      
    objects = CustomUserManager()

    groups = models.ManyToManyField(Group, related_name='custom_user_set')
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name=('user permissions'),
        blank=True,
        help_text=('Specific permissions for this user.'),
        related_name='custom_user_set'
    )



    class Meta:
        verbose_name = 'user'
        verbose_name_plural = 'users'

    def __str__(self):
        return self.email
    
    def get_user_name(self):
        return self.username

    
   
class Token(models.Model):
   user = models.ForeignKey(User, on_delete=models.CASCADE)
   key = models.CharField(max_length=40, unique=True)
    
    
class QuizCompletion(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    passed = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.user.username} - {'Passed' if self.passed else 'Not Passed'}"
 
class Message(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def str(self):
        return self.message
    
    
  


modeljp_path = os.path.join(os.path.dirname(__file__), '../app1/models/modeljp.h5')
Armodeljp_path = os.path.join(os.path.dirname(__file__), '../app1/models/Armodeljp.h5')



modeljp = load_model(modeljp_path)
Armodeljp = load_model(Armodeljp_path)


def load_arabic_model():
    model_path = os.path.join(os.path.dirname(__file__), '../app1/models/Armodeljp.h5')
    return load_model(model_path)

def load_american_model():
    model_path = os.path.join(os.path.dirname(__file__), '../app1/models/modeljp.h5')
    return load_model(model_path)


def preprocess_image(file_path, s=255):
    image = cv2.imread(file_path)
    info = np.iinfo(image.dtype)
    image = image.astype(np.float64) / info.max
    image = 255 * image
    image = image.astype(np.uint8)
    image_array = cv2.resize(image, (s, s))
    image_array = image_array.astype(np.uint8)
    return image_array
