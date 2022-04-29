from __future__ import unicode_literals

import logging

import json

import re

import traceback


def get_ip(r):
    x_forwarded_for = r.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip_ = x_forwarded_for.split(',')[0]
    else:
        ip_ = r.META.get('REMOTE_ADDR')
    return ip_


class APILog(object):
    """
    server 服务日志
    """

    def __init__(self, get_response):
        self.get_response = get_response
        self.app_log = logging.getLogger('app')  # 服务常规日志
        self.app_err_log = logging.getLogger('serverErr')  # 错误日志

    def process_exception(self, request, exception):
        """
        异常处理处理中间键
        """
        self.app_err_log.info(traceback.format_exc())

    def __call__(self, request):
        body = {}
        if request.body:
            try:
                body = json.loads(request.body)
            except json.JSONEncoder and json.JSONDecoder and json.JSONDecodeError:
                body = {}
        body.update(dict(request.POST))
        body.update(dict(request.GET))
        ip = get_ip(request)
        response = self.get_response(request)
        response_code = None
        responseValue = None
        if response.status_code != 500 and response.status_code != 404:
            try:
                responseValue = json.loads(response.getvalue())
                response_code = responseValue.get('code', None)
            except json.JSONDecodeError:
                response_code = 200
                responseValue = None
            if response_code == 200:
                responseValue = None
        elif response.status_code == 500:
            response_code = 500
            err = "path:" + request.path + "\n" + "body:" + str(body) + '\n'
            self.app_err_log.error(err)
            response.content = json.dumps({"code": 500, "msg": "app server error"})
        self.app_log.info("['{ip}','{method}','{path}','{status_code}','{body}','{response}','{response_code}']"
                          .format(ip=ip, method=request.method, path=request.path,
                                  status_code=response.status_code,
                                  body=body, response=responseValue, response_code=response_code))
        return response


class API_DB_err_log(object):
    """
    数据库错误日志
    """
    def __init__(self):
        self.db_err = logging.getLogger('dbERR')


db_err_log = API_DB_err_log()
