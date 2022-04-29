from baseModel.models import *


class User(BaseInfo):
    GENDER = (
        (0, '男'),
        (1, '女'),
        (2, '隐身状态')
    )
    birthday = models.DateTimeField(blank=False, null=False, verbose_name='出生日期')
    height = models.IntegerField(verbose_name='身高', null=True)
    weight = models.IntegerField(verbose_name='体重', null=True)
    qualifications = models.CharField(max_length=55, verbose_name='学历', null=True)
    gender = models.IntegerField(verbose_name='性别', choices=GENDER)

    class Meta:
        db_table = 'user'
        verbose_name = '求职用户'


class JobType(BaseIdField):
    title = models.CharField(max_length=255, verbose_name='工作类型')
    sub = models.ForeignKey('self', null=True, on_delete=models.CASCADE, verbose_name='子集工作类型', related_name='self')

    class Meta:
        db_table = 'job_type'
        verbose_name = '工作类型'


class Credentials(BaseIdField):
    name = models.CharField(max_length=255, verbose_name='名称')

    class Meta:
        db_table = 'credentials'
        verbose_name = '资格证书'


class WorkExperience(BaseTimeField, BaseDeleteField, Start_End_Time):
    enterprise_name = models.CharField(max_length=255, verbose_name='企业名称')
    job_description = models.CharField(max_length=1000, verbose_name='工作描述')
    label = models.ManyToManyField('enterprise.Label', verbose_name='职位标签', db_table='Work_experience_label')

    class Meta:
        db_table = 'work_experience'
        verbose_name = '工作经历'


class ProjectExperience(BaseTimeField, BaseDeleteField, Start_End_Time):
    project_name = models.CharField(max_length=255, verbose_name='项目名称')
    project_description = models.CharField(max_length=1000, verbose_name='工作描述')

    class Meta:
        db_table = 'project_experience'
        verbose_name = '项目经历'


class Resume(BaseTimeField, BaseDeleteField):
    job_type = models.OneToOneField('JobType', on_delete=models.CASCADE, verbose_name='工作类型')
    self_assessment = models.CharField(max_length=2000, verbose_name='自我评价')
    label = models.ManyToManyField('enterprise.Label', verbose_name='职位标签')

    class Meta:
        db_table = 'resume'
        verbose_name = '工作简历'


class Delivery_record(BaseTimeField, BaseDeleteField):
    STATE = (
        (0, '待阅读'),
        (1, '已阅读')
    )
    resume = models.ForeignKey('Resume', on_delete=models.CASCADE, verbose_name='简历',
                               related_name='delivery_position')
    position = models.ForeignKey('enterprise.Position', on_delete=models.CASCADE,
                                 verbose_name='职位信息', related_name='delivery_position')
    state = models.IntegerField(default=0, verbose_name='阅读状态', choices=STATE)

    class Meta:
        db_table = 'delivery_record'
        verbose_name = '简历投递记录'


class Interview(BaseTimeField, BaseDeleteField):
    STATE = (
        (0, '待面试'),
        (1, '已面试'),
    )
    position = models.ForeignKey('enterprise.Position', on_delete=models.CASCADE,
                                 verbose_name='职位信息', related_name='interview_position')
    user = models.ForeignKey('User', on_delete=models.CASCADE, verbose_name='用户', related_name='interview_user')
    interviewTime = models.DateTimeField(blank=False, null=True, verbose_name='面试时间')
    interview_address = models.CharField(max_length=255, verbose_name='面试地址', null=True)
    state = models.IntegerField(default=0, verbose_name='面试状态值')

    class Meta:
        db_table = 'interview'
        verbose_name = '邀请面试'
