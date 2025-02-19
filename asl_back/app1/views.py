from django import forms
from django.shortcuts import get_object_or_404
from django.contrib.auth.forms import UserCreationForm
from django.shortcuts import render
from rest_framework import generics, status, permissions
from rest_framework.response import Response
from rest_framework import status
from .models import Avatar, User
from rest_framework.generics import ListAPIView
from rest_framework.views import APIView
from .serializers import  LoginSerializer,LogoutSerializer,UserProfileUpdateSerializer
from .serializers import AvatarSerializer,UserSerializer
from django.contrib.auth.models import User
from django.contrib.auth import login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import authenticate
from django.contrib.auth.views import LoginView
from django.urls import reverse_lazy
from django.shortcuts import render, redirect
from rest_framework.authtoken.models import Token
from django.urls import reverse
from django.http import JsonResponse
from django.http import HttpResponse
from django.core.mail import EmailMessage
from rest_framework.decorators import action
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.views.decorators.csrf import csrf_exempt
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.tokens import default_token_generator
from django.views.generic import View
from rest_framework import viewsets
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
from rest_framework import status
from rest_framework.generics import CreateAPIView
from rest_framework_simplejwt.tokens import RefreshToken
from django.contrib.auth.hashers import make_password
from .serializers import UserSerializer, SignupSerializer
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate, login
from .models import QuizCompletion
import logging
from .models import Message
from .serializers import  MessageSerializer
from rest_framework.parsers import MultiPartParser
from keras.models import load_model 
import cv2
import numpy as np
from .models import load_arabic_model, load_american_model
from .models import modeljp, Armodeljp
from keras.preprocessing import image
# Create your views here.




    
class CustomUserCreationForm(UserCreationForm):
     class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

class UserSignupView(APIView):
    queryset = User.objects.all()
    serializer_class = CustomUserCreationForm
    permission_classes = []
    authentication_classes = []

    def post(self, request, *args, **kwargs):
        serializer = SignupSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
    
        user, token_key = serializer.save()
    
        user_instance = User.objects.get(pk=user.pk)
        print(f"Type of user_instance: {type(user_instance)}")

        return Response({'message': 'User created successfully.', 'token': token_key,'user':user.id}, status=status.HTTP_201_CREATED)
    
logger = logging.getLogger(__name__)




class UserLoginView(APIView):
    authentication_classes = []
    permission_classes = []

    def post(self, request, *args, **kwargs):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        email = serializer.validated_data['email']
        password = serializer.validated_data['password']

        user = authenticate(request, email=email, password=password)

        if user is not None and user.is_active:
            
            login(request, user)

            token, created = Token.objects.get_or_create(user=user)
            
            if isinstance(user, User):
                
                return Response({'token': token.key,'user':user.id} , status=status.HTTP_200_OK)
            else:
                return Response({'non_field_errors': ['Invalid user.']}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            return Response({'non_field_errors': ['Invalid email or password.']}, status=status.HTTP_401_UNAUTHORIZED)
    
class LogoutAPIView(generics.GenericAPIView):
    permission_classes = [permissions.IsAuthenticated]
    serializer_class = LogoutSerializer

    def post(self, request):
        request.user.auth_token.delete()
        return Response({'message': 'You have been logged out.'}, status=status.HTTP_200_OK)


   
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [IsAuthenticated]
    
        
class UserProfileUpdateView(APIView):
    permission_classes = [IsAuthenticated]

    def put(self, request, *args, **kwargs):
        serializer = UserProfileUpdateSerializer(data=request.data)
        
        if serializer.is_valid():
            user = request.user

            
            avatar = serializer.validated_data.get('avatar')
            username = serializer.validated_data.get('username')
            password = serializer.validated_data.get('password')

            
            if avatar and user.points >= 100:
                
                user.avatar = avatar
                user.points -= 100  
                user.save()

            
            if username:
                user.username = username
                user.save()

            if password:
                user.set_password(password)
                user.save()

            return Response({'message': 'Profile updated successfully.'}, status=status.HTTP_200_OK)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)     
    


class QuizCompletionView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        user = request.user
        passed_quiz = request.data.get('passed_quiz', False)

        try:
           
            user = User.objects.get(username=user.username)

            
            if passed_quiz:
                user.points += 50
                user.save()

            return Response({'points': user.points}, status=status.HTTP_200_OK)
        except User.DoesNotExist:
            return Response({'error': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)
    

class MessageCreateView(CreateAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    permission_classes = [IsAuthenticated]


    def perform_create(self, serializer):
        id = self.request.data.get('id')
        message = self.request.data.get('message')

        # Assuming user_id is a valid user ID, you can handle validation as needed
        serializer.save(id=id, message=message)

        return Response(serializer.data, status=status.HTTP_201_CREATED)


class MessageListCreateView(generics.ListCreateAPIView):
    queryset = Message.objects.all()
    serializer_class = MessageSerializer
    permission_classes = [IsAuthenticated]


    def get(self, request, *args, **kwargs):
        messages = Message.objects.all()
        message_strings = [str(message) for message in messages]
        return Response(message_strings)


def map_model_output_to_answer(prediction, threshold=0.9):
    
    print("Raw Prediction Values:", prediction)
    class_to_answer = {'0':0, '1':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7 , '8':8, '9':9, 'a':10, 'b':11, 'c':12, 'd':13, 'e':14,
        'f':15, 'g':16, 'h':17, 'i':18,'j':19, 'k':20, 'l':21, 'm':22, 'n':23, 'o':24,'p':25, 'q':26, 'r':27, 's':28, 
        't':29, 'u':30, 'v':31, 'w':32, 'x':33, 'y':34, 'z':35, 'del':36,'nothing':37,'space':38} 

   
    predicted_class = np.argmax(prediction)

    
    if prediction[0][predicted_class] > threshold:
        return True
    else:
        return False


def map_model_output_to_answer_ar(prediction, threshold=0.9):
    
    print("Raw Prediction Values:", prediction)
    class_to_answer = {'aleff':0, 'ba2':1, 'ta2':2, 'tha2':3, 'jeem':4, '7a2':5, '5a2':6, 'dal':7 , 'thal':8, 'ra2':9, 'zay':10, 'seen':11,
        'sheen':12, 'sad':13, 'dad':14,'tah':15, 'thah':16, 'ayn':17, 'ghyn':18,'fa2':19, '8af':20, 'kaf':21, 'lam':22, 
        'mem':23,'non':24,'ha2':25,'waw':26, 'ya2':27, 'yaa':28, 'all':29, 'toot':30, 'la':31} 

   
    predicted_class = np.argmax(prediction)

    
    if prediction[0][predicted_class] > threshold:
        return True
    else:
        return False
    
    
                
class AdvancedArabicQuizSubmission(APIView):
    permission_classes = []
    parser_classes = [MultiPartParser]
    def preprocess_image(self, file_path):
         
        image = cv2.imread(file_path)
        
        image = image.astype(np.float32) / 255.0
        
        image_array = cv2.resize(image, (100, 100))

        image_array = (image_array * 255).astype(np.uint8)

        return image_array

    def post(self, request, *args, **kwargs):
        user_image = request.data.get('image', None)

        if user_image:
            preprocessed_image = self.preprocess_image(user_image.temporary_file_path())
            ai_model = load_arabic_model()

            prediction = ai_model.predict(np.expand_dims(preprocessed_image, axis=0))
            answer = map_model_output_to_answer(prediction)

            return Response({'answer': answer}, status=status.HTTP_200_OK)
        else:
            return Response({'error': 'No image provided.'}, status=status.HTTP_400_BAD_REQUEST)


class AdvancedAmericanQuizSubmission(APIView):
    permission_classes = []
    parser_classes = [MultiPartParser]
    
    def preprocess_image(self, uploaded_file):
        
        content = uploaded_file.read()
        nparr = np.frombuffer(content, np.uint8)
        image = cv2.imdecode(nparr, cv2.IMREAD_COLOR)

        image = image.astype(np.float32) / 255.0
        image_array = cv2.resize(image, (100, 100))
        image_array = (image_array * 255).astype(np.uint8)

        return image_array
    
  

    def post(self, request, *args, **kwargs):
    
        user_image = request.data.get('image', None)
        expected_letter = request.data.get('expected_letter', '').lower()
        
        if user_image and expected_letter:
            preprocessed_image = self.preprocess_image(user_image)
            ai_model = load_american_model()

            prediction = ai_model.predict(np.expand_dims(preprocessed_image, axis=0))
            answer = map_model_output_to_answer_ar(prediction)

            return Response({'answer': answer}, status=status.HTTP_200_OK)
        else:
            return Response({'error': 'No image provided.'}, status=status.HTTP_400_BAD_REQUEST)
        
        