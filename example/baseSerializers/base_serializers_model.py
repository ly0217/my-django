from rest_framework import serializers
from enterprise.models import Label


class Base_serializers(serializers.ModelSerializer):
    code = serializers.IntegerField(default=200)
    msg = serializers.CharField(default='success')

    class Meta:
        model = Label
        fields = ('code', 'msg')


class Token_serializers(serializers.ModelSerializer):
    token = serializers.CharField(max_length=255, default='NOT_USER')

    class Meta:
        model = Label
        fields = ('token',)


class Login_serializers(Base_serializers):
    data = Token_serializers()

    class Meta:
        model = Label
        fields = ('code', 'msg', 'data')
