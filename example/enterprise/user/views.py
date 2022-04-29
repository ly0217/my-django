from rest_framework.views import APIView
from enterprise.models import Enterprise
from drf_yasg.utils import swagger_auto_schema
from baseOpenapiPar.openapi_parameter import id_openapi, token_openapi
from baseForms.base_forms import ID_, Login_forms
from packageResponse.package_reponse import *
from rest_framework.response import Response
from django.db.models import Q
from drf_yasg import openapi
from jwtToken.jwt_token import get_jwt_token
from config.conf import JWT_SECRET_KEY
from baseSerializers.base_serializers_model import Base_serializers, Login_serializers
import json


class Login(APIView):
    """
    登录
    """
    cache_rule = "enterprise_user_%s"  # 缓存规则名称

    @swagger_auto_schema(
        operation_summary='B端登录', request_body=openapi.Schema(
            type=openapi.TYPE_OBJECT,
            required=['name', 'passWord'],
            properties={'name': openapi.Schema(type=openapi.TYPE_STRING),
                        'passWord': openapi.Schema(type=openapi.TYPE_STRING)}
        ),
        operation_description="B端用户登录", responses={"200": Login_serializers()})
    def post(self, request):
        try:
            body = json.loads(request.body.decode('utf-8'))
        except json.JSONEncoder:
            return Response(response_parameter_err())
        par_ver = Login_forms(body)
        if par_ver.is_valid():
            user_ = list(Enterprise.objects.filter(
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


class User(APIView):

    @swagger_auto_schema(
        operation_summary='获取B端基本信息', manual_parameters=[token_openapi, id_openapi],
        operation_description="根据id获取企业基本信息", responses={"200": Base_serializers()})
    def get(self, request):
        """
        获取企业基本信息
        """
        id_ = request.GET.get('id', None)
        par_ver = ID_({'id': id_})  # 用forms 方式验证
        if par_ver.is_valid():
            return Response(response_200(msg='谢谢观看，接口作为演示，未完成'))
        else:
            return Response(response_parameter_err(data=par_ver.errors.get_json_data()))

    @swagger_auto_schema(
        operation_summary='更新B端基本信息',
        operation_description="接口作为演示，未完成", responses={"200": Base_serializers()})
    def put(self, request):
        """
        更新企业基本信息
        """
        pass

        return Response(response_200(msg='谢谢观看，接口作为演示，未完成'))

    @swagger_auto_schema(
        operation_summary='B端注册',
        operation_description="接口作为演示，未完成", responses={"200": Base_serializers()})
    def post(self, request):
        """
        注册
        """
        pass

        return Response(response_200(msg='谢谢观看，接口作为演示，未完成'))

    @swagger_auto_schema(
        operation_summary='B端注销',
        operation_description="接口作为演示，未完成", responses={"200": Base_serializers()})
    def delete(self, request):
        """
        注销
        """
        pass
        return Response(response_200(msg='谢谢观看，接口作为演示，未完成'))
