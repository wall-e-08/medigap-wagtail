from django import template
from article.models import ArticlePage

register = template.Library()


@register.simple_tag
def latest_articles(count=3):
    return ArticlePage.objects.all().live().order_by('-first_published_at')[:count]


