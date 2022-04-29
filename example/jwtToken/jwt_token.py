import jwt
import time
from config.conf import JWT_SECRET_KEY


def get_jwt_token(obj, jwt_secret_key=JWT_SECRET_KEY):
    """
    加密token
    """
    payload = {
        'iat': time.time(),
        'data': obj
    }
    token = jwt.encode(payload=payload, key=jwt_secret_key, algorithm='HS256')
    return str(token, encoding='utf-8')


def decode_jwt_token(token, jwt_secret_key=JWT_SECRET_KEY):
    """
    解密 token
    """
    try:
        obj = jwt.decode(token, key=jwt_secret_key, algorithms=['HS256'])
        return obj
    except jwt.exceptions.InvalidSignatureError as e:
        print(e)
        return False
    except jwt.exceptions.DecodeError as e:
        print(e)
        return False
