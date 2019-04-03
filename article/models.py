from django.db import models
from wagtail.core.models import Page
from wagtail.images.edit_handlers import ImageChooserPanel

from home.models import HomePage


class ArticleIndexPage(Page):
    max_count = 1
    parent_page_types = ['home.HomePage',]
    subpage_types = ['article.ArticlePage',]
    template = 'article/all_articles.html'

    feature_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Feature Background Image of Article Index Page",
        related_name="article_feature_bg",
    )

    content_panels = Page.content_panels + [
        ImageChooserPanel('feature_bg')
    ]

    def get_context(self, request):
        context = super(ArticleIndexPage, self).get_context(request)
        context['home_page'] = HomePage.objects.first()
        return context


class ArticlePage(Page):
    # parent_page_types = [ArticleIndexPage,]
    pass

