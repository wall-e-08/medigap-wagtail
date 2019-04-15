from django import template
from wagtail.core.templatetags.wagtailcore_tags import slugurl

from article.models import ArticlePage
from home.models import QuoteFormPage
from quotes.forms import LeadForm

register = template.Library()


@register.simple_tag
def latest_articles(count=3):
    return ArticlePage.objects.all().live().order_by('-first_published_at')[:count]


@register.simple_tag
def quote_form():
    return LeadForm()


@register.simple_tag(takes_context=True)
def get_quote_page_url(context):
    quote_page = QuoteFormPage.objects.first()
    if quote_page:
        return slugurl(context, quote_page.slug)
    else:
        return '#'



