def response_query_200(data=None, msg='success'):
    """
    查询值正常返回200
    """
    return {"code": 200, "msg": msg, "data": data}


def response_200(msg='success'):
    """
    返回200
    """
    return {"code": 200, "msg": msg}


def response_query_404(msg='not found'):
    return {"code": 2404, "msg": msg}


def response_parameter_err(data=None, msg="parameter err"):
    return {"code": 400, "msg": msg, "data": data}
