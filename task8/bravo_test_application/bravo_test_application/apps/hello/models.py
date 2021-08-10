from django.db import models


class Testdata(models.Model):
    user_name = models.CharField('user name', max_length=50)

    def __str__(self):
        return self.user_name
