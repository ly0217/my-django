from baseModel.models import *

from django.db import models


# 经纬度基本属性
class BaseGeoCoordinateFiled(BaseTimeField, BaseDeleteField):
    COORDINATE_SYSTEM = (
        (0, 'WGS_84'),  # 84坐标
        (1, 'GCJ02'),  # 火星坐标
        (2, 'CGS200'),  # 2000坐标系
        (3, 'BD09'),  # 百度坐标
    )
    lon = models.FloatField(default=-400, verbose_name='经度')
    lat = models.FloatField(default=400, verbose_name='纬度')
    alt = models.FloatField(null=True, verbose_name='高程')
    coordinate_system = models.IntegerField(verbose_name='坐标系统', default=0, choices=COORDINATE_SYSTEM)

    class Meta:
        db_table = 'coordinate'
        verbose_name = '导航坐标'


class Label(BaseIdField):
    label = models.CharField(max_length=20, verbose_name='标签')

    class Meta:
        db_table = 'label'
        verbose_name = '标签'


class Enterprise(BaseInfo):
    """
    企业基本信息
    """
    introduction = models.CharField(max_length=1000, verbose_name='简介', null=True)
    coordinate = models.ForeignKey('BaseGeoCoordinateFiled', related_name='rel_coordinate',
                                   on_delete=models.DO_NOTHING, verbose_name='关联位置信息')
    founded = models.CharField(max_length=55, verbose_name='成立时间', null=True)
    registered_capital = models.CharField(max_length=55, verbose_name='注册资本', null=True)
    employees = models.CharField(max_length=55, verbose_name='员工人数', null=True)
    corporate_representative = models.CharField(max_length=55, verbose_name='法人代表', null=True)

    class Meta:
        db_table = 'enterprise'
        verbose_name = '企业基本信息'

    def __str__(self):
        return self.name

    def baseInfo(self):
        """
        基本信息
        """
        return {
            'id': self.id
        }


class Position(BaseTimeField, BaseDeleteField):
    """
    职位基本信息
    """
    STATE = (
        (0, '下架'),
        (1, '招聘中'),
    )
    title = models.CharField(max_length=255, verbose_name='职位名称')
    min_salary = models.IntegerField(verbose_name='最低工资', null=True)
    max_salary = models.IntegerField(verbose_name='最高工资', null=True)
    job_requirement = models.CharField(max_length=1000, verbose_name='职位要求', null=True)
    label = models.ManyToManyField('Label', verbose_name='职位标签', db_table='position_table')
    recruits = models.CharField(max_length=10, verbose_name='招聘人数')
    releaseTime = models.DateTimeField(blank=False, null=False, verbose_name='发布时间')
    job_address = models.CharField(max_length=255, verbose_name='工作地址', null=True)
    state = models.IntegerField(verbose_name='状态值', choices=STATE, default=1)

    class Meta:
        db_table = 'position'
        verbose_name = '职位基本信息'

    def __str__(self):
        return self.title
