"""
Django settings for core project.

Generated by 'django-admin startproject' using Django 2.1.7.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.1/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
import dj_database_url

from PIL import ImageFile

# fix: truncated image upload bug in imagechooserpanel
ImageFile.LOAD_TRUNCATED_IMAGES = True

PROJECT_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BASE_DIR = os.path.dirname(PROJECT_DIR)


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.1/howto/deployment/checklist/


# Application definition

INSTALLED_APPS = [
    'home',
    'article',
    'search',
    'quotes',

    'condensedinlinepanel',  # menu management from admin panel
    'wagtailmenus',
    'wagtail.contrib.modeladmin',
    'wagtail.contrib.routable_page',
    'wagtail.contrib.settings',
    'wagtail.contrib.styleguide',
    'wagtail.contrib.forms',
    'wagtail.contrib.redirects',
    'django.contrib.sitemaps',
    'wagtail.embeds',
    'wagtail.sites',
    'wagtail.users',
    'wagtail.snippets',
    'wagtail.documents',
    'wagtail.images',
    'wagtail.search',
    'wagtail.admin',
    'wagtail.core',

    'modelcluster',
    'taggit',

    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]

MIDDLEWARE = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',

    'wagtail.core.middleware.SiteMiddleware',
    'wagtail.contrib.redirects.middleware.RedirectMiddleware',
]

ROOT_URLCONF = 'core.urls'
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(PROJECT_DIR, 'templates'),
        ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'django.template.context_processors.media',
                'wagtail.contrib.settings.context_processors.settings',
                'wagtailmenus.context_processors.wagtailmenus',
            ],
        },
    },
]

WSGI_APPLICATION = 'core.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.1/ref/settings/#databases

DATABASE_URL = os.environ.get('DATABASE_URL')

if DATABASE_URL:
    DATABASES = {
        'default': dj_database_url.config(default=DATABASE_URL)
    }
else:
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        }
    }


# Password validation
# https://docs.djangoproject.com/en/2.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    # {
    #     'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    # },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.1/howto/static-files/

STATICFILES_FINDERS = [
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
]

STATICFILES_DIRS = [
    os.path.join(PROJECT_DIR, 'static'),
]

# ManifestStaticFilesStorage is recommended in production, to prevent outdated
# Javascript / CSS assets being served from cache (e.g. after a Wagtail upgrade).
# See https://docs.djangoproject.com/en/2.1/ref/contrib/staticfiles/#manifeststaticfilesstorage
# STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.ManifestStaticFilesStorage'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')
STATIC_URL = '/static/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'


# Wagtail settings

WAGTAIL_SITE_NAME = "core"

# Base URL to use when referring to full URLs within the Wagtail admin backend -
# e.g. in notification emails. Don't include '/admin' or a trailing slash
BASE_URL = 'http://example.com'

# wagtail rich text
RICH_TEXT_BLOCK = ['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'ol', 'ul', 'align']
RICH_TEXT_INLINE = ['bold', 'italic', 'monospace']
RICH_TEXT_ENTITIES = ['image', 'embed', 'link', 'document-link']
RICH_TEXT_MISC = ['hr', 'calour palette']

RICH_TEXT_FEATURE_TYPE_A = (
    RICH_TEXT_BLOCK +
    RICH_TEXT_INLINE +
    RICH_TEXT_ENTITIES +
    RICH_TEXT_MISC
)


US_STATES = (
    ('AL', 'Alabama'), ('AK', 'Alaska'), ('AZ', 'Arizona'), ('AR', 'Arkansas'),
    ('CA', 'California'), ('CO', 'Colorado'), ('CT', 'Connecticut'),
    ('DE', 'Delaware'), ('DC', 'District of Columbia'),
    ('FL', 'Florida'),
    ('GA', 'Georgia'),
    ('HI', 'Hawaii'),
    ('ID', 'Idaho'), ('IL', 'Illinois'), ('IN', 'Indiana'), ('IA', 'Iowa'),
    ('KS', 'Kansas'), ('KY', 'Kentucky'),
    ('LA', 'Louisiana'),
    ('ME', 'Maine'), ('MD', 'Maryland'), ('MA', 'Massachusetts'), ('MI', 'Michigan'), ('MN', 'Minnesota'), ('MS', 'Mississippi'), ('MO', 'Missouri'), ('MT', 'Montana'),
    ('NE', 'Nebraska'), ('NV', 'Nevada'), ('NH', 'New Hampshire'), ('NJ', 'New Jersey'), ('NM', 'New Mexico'), ('NY', 'New York'), ('NC', 'North Carolina'), ('ND', 'North Dakota'),
    ('OH', 'Ohio'), ('OK', 'Oklahoma'), ('OR', 'Oregon'),
    ('PA', 'Pennsylvania'),
    ('RI', 'Rhode Island'),
    ('SC', 'South Carolina'), ('SD', 'South Dakota'),
    ('TN', 'Tennessee'), ('TX', 'Texas'),
    ('UT', 'Utah'),
    ('VT', 'Vermont'), ('VA', 'Virginia'),
    ('WA', 'Washington'), ('WV', 'West Virginia'), ('WI', 'Wisconsin'), ('WY', 'Wyoming'),
)


LEAD_GATEWAY_ADDRESS = os.environ.get('LEAD_GATEWAY_ADDRESS')
LEAD_CAMPAIGN_ID = os.environ.get('LEAD_CAMPAIGN_ID')
IS_LEAD_TEST = False
