import time


def getNowTimeStr():
    """
    返回当前时间字符串
    """
    return time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
