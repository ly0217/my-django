from django.db import models

DELETE = (
    (0, '用户删除'),
    (1, '正常状态'),
)


# id 基本字段
class BaseIdField(models.Model):
    id = models.AutoField(primary_key=True, verbose_name='id')

    class Meta:
        abstract = True


# 相关时间基本字段 dateutil=timezone.now,
class BaseTimeField(BaseIdField):
    createTime = models.DateTimeField(blank=False, null=False, verbose_name='创建时间')
    updateTime = models.DateTimeField(blank=False, null=False, verbose_name='修改时间')

    class Meta:
        abstract = True


# 删除基本字段
class BaseDeleteField(models.Model):
    delete = models.IntegerField(default=1, verbose_name='删除', choices=DELETE)

    class Meta:
        abstract = True


class Start_End_Time(models.Model):
    """
    结束有至今情况 把字段命名为字符串类型
    """
    startTime = models.CharField(max_length=255, verbose_name='开始时间', null=True)
    endTime = models.CharField(max_length=255, verbose_name='结束时间', null=True)

    class Meta:
        abstract = True


# info基本字段
class BaseInfo(BaseTimeField, BaseDeleteField):
    name = models.CharField(max_length=255, verbose_name='名称')
    avatarUrl = models.CharField(max_length=255, verbose_name='头像')
    notes = models.CharField(max_length=1000, verbose_name='备注', null=True)
    address = models.CharField(max_length=255, verbose_name='地址', null=True)
    phone = models.CharField(max_length=255, verbose_name='联系电话', null=True)
    email = models.EmailField(verbose_name='邮箱', null=True)
    passWord = models.CharField(max_length=20, verbose_name='密码')

    class Meta:
        abstract = True

