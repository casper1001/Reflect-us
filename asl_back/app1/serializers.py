from rest_framework import serializers
from app1.models import Avatar, User
from django.contrib.auth import authenticate
from django.core.exceptions import ValidationError
from rest_framework.authtoken.models import Token
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.http import urlsafe_base64_decode
from django.contrib.auth import get_user_model
import hashlib,time,json
from django.contrib.auth.models import AbstractUser
from .models import Message


User = get_user_model()

class AvatarSerializer(serializers.ModelSerializer):
    class Meta:
        model = Avatar
        fields = '__all__'

class UserSerializer(serializers.ModelSerializer):
    token = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ('user_id', 'username', 'email', 'points', 'avatar','token')
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        password = validated_data.pop('password')
        user = User.objects.create_user(
            username=validated_data['username'],
            email=validated_data['email'],
            password=password,
            points=validated_data.get('points', 100), 
            avatar=validated_data.get('avatar', None),
        )
      
        return user

    def get_token(self, obj):
        token, created = Token.objects.get_or_create(user=obj)
        return token.key


    
        
class SignupSerializer(serializers.Serializer):
    username = serializers.CharField()
    email = serializers.EmailField()
    password1 = serializers.CharField(write_only=True)
    password2 = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
        extra_kwargs = {'password1': {'write_only': True}, 'password2': {'write_only': True}}

    def validate(self, data):
       
        if data['password1'] != data['password2']:
            raise serializers.ValidationError("Passwords do not match.")
        return data

    def create(self, validated_data):
        username = validated_data.get('username')
        email = validated_data.get('email')
        password = validated_data.get('password1')

        
        if User.objects.filter(username=username).exists():
            raise serializers.ValidationError("A user with this username already exists.")

        
        user = User.objects.create_user(
            username=username,
            email=email,
            password=password
        )

       
        token, created = Token.objects.get_or_create(user=user)

        return user, token.key  

    
   
class LoginSerializer(serializers.Serializer):
     email = serializers.EmailField()
     password = serializers.CharField()

     def validate(self, data):
        email = data.get('email')
        password = data.get('password')

        if email and password:
            user = authenticate(request=self.context.get('request'), email=email, password=password)
            if not user:
                
                raise serializers.ValidationError('Unable to login with provided credentials.')
            if not user.is_active:
                
                raise serializers.ValidationError('User account is not activated yet.')
        else:
          raise serializers.ValidationError('Must include "email" and "password."')

        data['user'] = user
        
        return data

    
class TokenSerializer(serializers.Serializer):
    token = serializers.CharField(max_length=255)
    user = UserSerializer()

    def create(self, validated_data):
        user_id = validated_data['user']['id']
        token = validated_data['token']

        token_obj, created = Token.objects.get_or_create(user_id=user_id)
        token_obj.key = token
        token_obj.save()

        return token_obj

    def to_representation(self, instance):
        data = super().to_representation(instance)
        user = instance.user
        data['user'] = {
            'id': user.id,
            'email': user.email,
            'username': user.username,
            
        }
        return data
    
class LogoutSerializer(serializers.Serializer):
    message = serializers.CharField(default="You have been logged out.")
    
    
        
class UserProfileUpdateSerializer(serializers.Serializer):
    avatar = serializers.ImageField(required=False)
    username = serializers.CharField(max_length=255, required=False)
    password = serializers.CharField(max_length=255, required=False)



class MessageSerializer(serializers.ModelSerializer):
    user = UserSerializer()
    class Meta:
        model = Message
        fields = ['user', 'message', 'created_at']






