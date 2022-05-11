from django import forms
from baseForms.field_err_desc import *
from jwtToken.jwt_token import decode_jwt_token
from config.conf import JWT_SECRET_KEY, REDIS_CACHE_TIME
import time


class ID_(forms.Form):
    id = forms.IntegerField(required=True, error_messages={
        "required": EMPTY_ERR % "id", "invalid": FIELD_TYPE_ERR % "id"})

    def __init__(self, *args, **kwargs):
        if 'request' in kwargs.keys():
            self.request = kwargs.pop('request')
        super(ID_, self).__init__(*args, **kwargs)


class Login_forms(forms.Form):
    name = forms.CharField(max_length=255,
                           error_messages={"required": EMPTY_ERR % "name", "max_length": FIELD_OVER_LENGTH % "name"})
    passWord = forms.CharField(max_length=255,
                               error_messages={"required": EMPTY_ERR % "passWord",
                                               "max_length": FIELD_OVER_LENGTH % "passWord"})

    def __init__(self, *args, **kwargs):
        if 'request' in kwargs.keys():
            self.request = kwargs.pop('request')
        super(Login_forms, self).__init__(*args, **kwargs)


class Token(forms.Form):
    token = forms.CharField(max_length=255,
                            error_messages={"required": EMPTY_ERR % "token",
                                            "max_length": FIELD_OVER_LENGTH % "token"})

    def __init__(self, *args, **kwargs):
        if 'request' in kwargs.keys():
            self.request = kwargs.pop('request')
        super(Token, self).__init__(*args, **kwargs)

    def clean_token(self):
        """
        验证token 合法
        """
       
        obj = decode_jwt_token(self.cleaned_data['token'], jwt_secret_key=JWT_SECRET_KEY)
        if obj and obj['iat'] < time.time() + REDIS_CACHE_TIME:
            self.cleaned_data['user_id'] = obj['data']['id']
            return self.cleaned_data['token']
        else:
            raise forms.ValidationError('invalid token')
        
