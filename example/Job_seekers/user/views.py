import json

from django.db.models import Q
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema
from rest_framework.response import Response
from rest_framework.views import APIView

from baseForms.base_forms import Login_forms
from baseSerializers.base_serializers_model import Login_serializers
from config.conf import JWT_SECRET_KEY
from jwtToken.jwt_token import get_jwt_token
from packageResponse.package_reponse import *
from Job_seekers.models import User


class Login(APIView):
    """
    用户登录
    """
    cache_rule = "job_seekers_user_%s"  # 缓存规则名称

    @swagger_auto_schema(
        operation_summary='C端登录', request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            required=['name', 'passWord'],
            properties={'name': openapi.Schema(type=openapi.TYPE_STRING),
                        'passWord': openapi.Schema(type=openapi.TYPE_STRING)}
        ),
        operation_description="C端用户登录", responses={"200": Login_serializers()})
    def post(self, request):
        try:
            body = json.loads(request.body.decode('utf-8'))
        except json.JSONEncoder:
            return Response(response_parameter_err())
        par_ver = Login_forms(body)
        if par_ver.is_valid():
            user_ = list(User.objects.filter(
                Q(name=par_ver.cleaned_data['name']) | Q(phone=par_ver.cleaned_data['name'])
                | Q(email=par_ver.cleaned_data['name'])).filter(
                passWord=par_ver.cleaned_data['passWord']).values('id', 'name'))
            if user_:
                token = get_jwt_token(obj=user_[0], jwt_secret_key=JWT_SECRET_KEY)

                return Response(response_query_200(data={'token': token}))
            else:
                return Response(response_query_404())
        else:
            return Response(response_parameter_err(data=par_ver.errors.get_json_data()))


