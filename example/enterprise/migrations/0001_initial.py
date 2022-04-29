# Generated by Django 3.2.3 on 2022-04-24 08:43

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='BaseGeoCoordinateFiled',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='id')),
                ('createTime', models.DateTimeField(verbose_name='创建时间')),
                ('updateTime', models.DateTimeField(verbose_name='修改时间')),
                ('delete', models.IntegerField(choices=[(0, '用户删除'), (1, '正常状态')], default=1, verbose_name='删除')),
                ('lon', models.FloatField(default=-400, verbose_name='经度')),
                ('lat', models.FloatField(default=400, verbose_name='纬度')),
                ('alt', models.FloatField(null=True, verbose_name='高程')),
                ('coordinate_system', models.IntegerField(choices=[(0, 'WGS_84'), (1, 'GCJ02'), (2, 'CGS200'), (3, 'BD09')], default=0, verbose_name='坐标系统')),
            ],
            options={
                'verbose_name': '导航坐标',
                'db_table': 'coordinate',
            },
        ),
        migrations.CreateModel(
            name='Label',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='id')),
                ('label', models.CharField(max_length=20, verbose_name='标签')),
            ],
            options={
                'verbose_name': '标签',
                'db_table': 'label',
            },
        ),
        migrations.CreateModel(
            name='Position',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='id')),
                ('createTime', models.DateTimeField(verbose_name='创建时间')),
                ('updateTime', models.DateTimeField(verbose_name='修改时间')),
                ('delete', models.IntegerField(choices=[(0, '用户删除'), (1, '正常状态')], default=1, verbose_name='删除')),
                ('title', models.CharField(max_length=255, verbose_name='职位名称')),
                ('min_salary', models.IntegerField(null=True, verbose_name='最低工资')),
                ('max_salary', models.IntegerField(null=True, verbose_name='最高工资')),
                ('job_requirement', models.CharField(max_length=1000, null=True, verbose_name='职位要求')),
                ('recruits', models.CharField(max_length=10, verbose_name='招聘人数')),
                ('releaseTime', models.DateTimeField(verbose_name='发布时间')),
                ('job_address', models.CharField(max_length=255, null=True, verbose_name='工作地址')),
                ('state', models.IntegerField(choices=[(0, '下架'), (1, '招聘中')], default=1, verbose_name='状态值')),
                ('label', models.ManyToManyField(db_table='position_table', to='enterprise.Label', verbose_name='职位标签')),
            ],
            options={
                'verbose_name': '职位基本信息',
                'db_table': 'position',
            },
        ),
        migrations.CreateModel(
            name='Enterprise',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False, verbose_name='id')),
                ('createTime', models.DateTimeField(verbose_name='创建时间')),
                ('updateTime', models.DateTimeField(verbose_name='修改时间')),
                ('delete', models.IntegerField(choices=[(0, '用户删除'), (1, '正常状态')], default=1, verbose_name='删除')),
                ('name', models.CharField(max_length=255, verbose_name='名称')),
                ('avatarUrl', models.CharField(max_length=255, verbose_name='头像')),
                ('notes', models.CharField(max_length=1000, null=True, verbose_name='备注')),
                ('address', models.CharField(max_length=255, null=True, verbose_name='地址')),
                ('phone', models.CharField(max_length=255, null=True, verbose_name='联系电话')),
                ('email', models.EmailField(max_length=254, null=True, verbose_name='邮箱')),
                ('passWord', models.CharField(max_length=20, verbose_name='密码')),
                ('introduction', models.CharField(max_length=1000, null=True, verbose_name='简介')),
                ('founded', models.CharField(max_length=55, null=True, verbose_name='成立时间')),
                ('registered_capital', models.CharField(max_length=55, null=True, verbose_name='注册资本')),
                ('employees', models.CharField(max_length=55, null=True, verbose_name='员工人数')),
                ('corporate_representative', models.CharField(max_length=55, null=True, verbose_name='法人代表')),
                ('coordinate', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='rel_coordinate', to='enterprise.basegeocoordinatefiled', verbose_name='关联位置信息')),
            ],
            options={
                'verbose_name': '企业基本信息',
                'db_table': 'enterprise',
            },
        ),
    ]