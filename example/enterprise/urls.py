from django.urls import path
from enterprise.user import views as enterprise_user

urlpatterns = [
    path('login/', enterprise_user.Login.as_view(), name='enterprise_login'),
    path('user/', enterprise_user.User.as_view(), name='enterprise_user'),
]
