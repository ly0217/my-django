import time

import os

cur_path = os.path.dirname(os.path.realpath(__file__))  # log_path是存放日志的路径

log_path = os.path.join(os.path.dirname(cur_path), 'app_log')  # 记录所有的错误日志

if not os.path.exists(log_path):  # 如果不存在这个logs文件夹，就自动创建一个
    os.mkdir(log_path)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        # 日志格式
        'standard': {
            'format': '[%(asctime)s] [%(filename)s:%(lineno)d] [%(module)s:%(funcName)s] '
                      '[%(levelname)s]- %(message)s'},
        'simple': {  # 简单格式
            'format': '%(levelname)s %(message)s'
        },
        'verbose': {
            'format': '["%(levelname)s","%(asctime)s","%(message)s"]'
        }
    },
    # 过滤
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }

    },
    # 定义具体处理日志的方式
    'handlers': {
        'appLog': {  # miniApp访问日志
            'level': 'INFO',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': os.path.join(log_path, 'app_log_{}.log'.format(time.strftime('%Y-%m-%d'))),
            'maxBytes': 1024 * 1024 * 50,  # 50 MB
            'backupCount': 5,
            'formatter': 'verbose',
            'encoding': 'utf-8',  # 设置默认编码
        },
        'error': {  # 服务错误日志
            'level': 'ERROR',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': os.path.join(log_path, 'server_error_{}.log'.format(time.strftime('%Y-%m-%d'))),
            'maxBytes': 1024 * 1024 * 50,  # 文件大小
            'backupCount': 5,  # 备份数
            'formatter': 'verbose',  # 输出格式
            'encoding': 'utf-8',  # 设置默认编码
        },
        'db_err': {
            'level': 'INFO',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': os.path.join(log_path, 'db_err_log_{}.log'.format(time.strftime('%Y-%m-%d'))),
            'maxBytes': 1024 * 1024 * 50,  # 文件大小
            'backupCount': 5,  # 备份数
            'formatter': 'verbose',  # 输出格式
            'encoding': 'utf-8',  # 设置默认编码
        },

    },
    # 配置用哪几种 handlers 来处理日志
    'loggers': {
        'app': {
            'handlers': ['appLog'],
            'level': 'INFO',
            'propagate': True
        },
        'serverErr': {
            'handlers': ['error'],
            'level': 'INFO',
            'propagate': True
        },
        'dbERR': {
            'handlers': ['db_err'],
            'level': 'INFO',
            'propagate': True
        }
    }
}
