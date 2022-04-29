import redis
from config.conf import REDIS_HOST, REDIS_PORT, REDIS_DB, REDIS_CACHE_TIME
from logInit.logMiddleware import db_err_log


class RedisClient:
    def __init__(self):
        self.host = REDIS_HOST
        self.port = REDIS_PORT
        self.db = REDIS_DB
        self.ex = REDIS_CACHE_TIME
        self.client = redis.Redis(host=self.host, port=self.port, db=self.db)

    def get_values(self, key):
        """
        redis 根据key获取值
        """
        pass
        try:
            values = self.client.get(key)
            return True, values
        except redis.RedisError as e:
            db_err_log.db_err.info(
                '{db_type},{cz_type},{host},{port},{db_number},{key},{err}'.format(
                    db_type='redis',
                    cz_type='get_values',
                    host=self.host, port=self.port,
                    db_number=self.db, key=key, err=e))
            return False, e

    def set_values(self, key, values, ex=REDIS_CACHE_TIME):
        """
        redis 写入key
        """
        try:
            self.client.set(name=key, value=values, ex=ex)
            return True, None
        except redis.RedisError as e:
            db_err_log.db_err.info(
                '{db_type},{cz_type},{host},{port},{db_number},{key},{err}'.format(
                    db_type='redis',
                    cz_type='set_values',
                    host=self.host, port=self.port,
                    db_number=self.db, key=key, err=e))
            return False, e

    def delete(self, key):
        """
        redis 删除key
        """
        try:
            self.client.delete(key)
            return True, None
        except redis.RedisError as e:
            db_err_log.db_err.info(
                '{db_type},{cz_type},{host},{port},{db_number},{key},{err}'.format(
                    db_type='redis', cz_type='delete',
                    host=self.host, port=self.port,
                    db_number=self.db, key=key, err=e))
            return False, e


re_client = RedisClient()
