import re

from django.urls import re_path
from django.shortcuts import render
from django.conf.urls.static import serve


def robot(request):
    return render(request, 'robot.txt', content_type="text/plain")


def static(prefix, view=serve, **kwargs):
    """
    Return a URL pattern for serving files in debug mode.
    """
    return [
        re_path(r'^%s(?P<path>.*)$' % re.escape(prefix.lstrip('/')), view, kwargs=kwargs),
    ]
