"""
WSGI config for core project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "core.settings.dev")

PROJECT_ROOT = os.path.dirname(os.path.dirname(
    os.path.abspath(__file__)
))
sys.path.append(os.path.join(PROJECT_ROOT, "packages"))

application = get_wsgi_application()
