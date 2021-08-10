from django.shortcuts import render
from .models import Testdata
from django.http import HttpResponseRedirect
from django.urls import reverse
import socket as s


def index(request):
    users_list = Testdata.objects.order_by('user_name')
    host_ip = s.gethostbyname(s.gethostname())
    return render(request, 'hello/hello.html', {'users_list': users_list, 'host_ip': host_ip})


def add_user(request):
    a = Testdata()
    a.user_name = request.POST['user_name']
    a.save()
    return HttpResponseRedirect(reverse('hello:index'))
