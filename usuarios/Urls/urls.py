from django.urls import path
from rest_framework_simplejwt.views import TokenObtainPairView
from usuarios.views import PerfilView, login_frontend

urlpatterns = [
    path('login-page/', login_frontend, name='login-page'),
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('perfil/', PerfilView.as_view(), name='perfil'),
]
