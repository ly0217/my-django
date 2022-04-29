
from django.urls import path
from Job_seekers.user import views as job_views

urlpatterns = [
    path('login/', job_views.Login.as_view(), name='job_login'),
]
