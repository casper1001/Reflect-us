from django.urls import path , include
from .views import UserSignupView, UserLoginView,LogoutAPIView,UserViewSet
from django.contrib.auth.views import LoginView
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework.routers import DefaultRouter
from django.contrib import admin
from .views import UserProfileUpdateView
from .views import AdvancedArabicQuizSubmission, AdvancedAmericanQuizSubmission
from .views import MessageCreateView, MessageListCreateView
from .views import QuizCompletionView

router = DefaultRouter()
router.register(r'users',UserViewSet)



urlpatterns = [
    path('api/UserSignup/', UserSignupView.as_view(), name='user-Signup'),
    path('api/login/', UserLoginView.as_view(), name='user-login'),
    path('api/logout/', LogoutAPIView.as_view(), name='logout'),
    
    path('', include(router.urls)),
    path('api-auth/', include('rest_framework.urls')),
    path('api/', include(router.urls)),
   
    path('api/messages/create/', MessageCreateView.as_view(), name='create_message'),
    path('api/messages/', MessageListCreateView.as_view(), name='list_create_messages'),
    
    path('admin/', admin.site.urls),
    path('api/user/profile/update/', UserProfileUpdateView.as_view(), name='user-profile-update'),
    
    path('quiz-completion/', QuizCompletionView.as_view(), name='quiz-completion'),
    
    path('api/advanced-arabic-quiz/', AdvancedArabicQuizSubmission.as_view(), name='advanced-arabic-quiz'),
    path('api/advanced-american-quiz/', AdvancedAmericanQuizSubmission.as_view(), name='advanced-american-quiz'),
     
]

