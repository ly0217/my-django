"""
swagger openapi 自定义参数
"""
from drf_yasg import openapi

id_openapi = openapi.Parameter(name='id', in_=openapi.IN_QUERY, description="自增id", type=openapi.TYPE_INTEGER)
token_openapi = openapi.Parameter(name='token', in_=openapi.IN_QUERY, description="token", type=openapi.TYPE_STRING)


