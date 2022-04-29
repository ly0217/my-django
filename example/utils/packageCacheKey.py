
def package_redis_key(rules, unique):
    """
    组装redis key值
    rules key编码规则
    unique 缓存值唯一性
    """
    return "%s_%s" % (str(rules), str(unique))
