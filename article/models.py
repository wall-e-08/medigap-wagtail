from django.db import models
from django.conf import settings
from django.db.models import F

from modelcluster.contrib.taggit import ClusterTaggableManager
from modelcluster.fields import ParentalKey

from taggit.models import TaggedItemBase, Tag as TaggitTag

from wagtail.admin.edit_handlers import FieldPanel, TabbedInterface, ObjectList
from wagtail.contrib.routable_page.models import route, RoutablePageMixin
from wagtail.core.fields import RichTextField
from wagtail.core.models import Page
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

from home.models import HomePage


class ArticleIndexPage(RoutablePageMixin, Page):
    max_count = 1
    parent_page_types = ['home.HomePage',]
    subpage_types = ['article.ArticlePage',]
    template = 'article/all_articles.html'

    # custom settings
    is_show_recent_articles = True
    show_recent_articles_count = 5
    is_show_most_viewed_articles = True
    show_most_viewed_articles_count = 3

    feature_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Feature Background Image of Article Index Page",
        related_name="article_feature_bg",
    )

    # sidebar form
    sidebar_form_main_heading = models.CharField(
        blank=True, null=True,
        max_length=250,
    )
    sidebar_form_bg = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Background Image above sidebar form",
        related_name="article_sidebar_form_bg",
    )
    sidebar_form_heading = models.CharField(
        blank=True, null=True,
        max_length=250,
    )

    base_panel = [ImageChooserPanel('feature_bg'),]
    sidebar_panel = [
        FieldPanel('sidebar_form_main_heading'),
        ImageChooserPanel('sidebar_form_bg'),
        FieldPanel('sidebar_form_heading'),
    ]

    edit_handler = TabbedInterface([
        ObjectList(base_panel, heading='Content'),
        ObjectList(sidebar_panel, heading='Sidebar', classname="list-ul"),
        ObjectList(Page.promote_panels, heading='Promote'),
        ObjectList(Page.settings_panels, heading='Publish Settings', classname="settings"),
    ])

    def get_context(self, request, *args, **kwargs):
        context = super(ArticleIndexPage, self).get_context(request, *args, **kwargs)
        context['home_page'] = HomePage.objects.first()
        context['article_index_page'] = self
        context['all_tags'] = [Tag.objects.get(id=x) for x in ArticlePage.objects.all().values_list('tags', flat=True)]
        context['recent_articles'] = self.get_latest_articles()
        context['most_viewed_articles'] = self.get_most_viewed_articles()
        return context

    def get_articles(self):
        return ArticlePage.objects.descendant_of(self).live()

    def get_latest_articles(self):
        return ArticlePage.objects.descendant_of(self).live().order_by('-first_published_at')[:self.show_recent_articles_count] \
            if self.is_show_recent_articles else None

    def get_most_viewed_articles(self):
        return ArticlePage.objects.descendant_of(self).live().order_by('-hit_count')[:self.show_most_viewed_articles_count] \
            if self.is_show_most_viewed_articles else None

    @route(r'^tag/(?P<tag>[-\w]+)/$')
    def article_by_tag(self, request, tag, *args, **kwargs):
        self.search_type = 'tag'
        self.search_term = tag
        self.get_children = self.get_articles().filter(tags__slug=tag)
        return Page.serve(self, request, *args, **kwargs)


class ArticlePage(Page):
    parent_page_types = [ArticleIndexPage,]
    subpage_types = []
    template = 'article/single_article.html'

    hit_count = models.IntegerField(default=0)
    like_count = models.IntegerField(default=0)

    feature_img = models.ForeignKey(
        'wagtailimages.Image',
        on_delete=models.SET_NULL,
        blank=True, null=True,
        help_text="Feature Image of Article",
        related_name="each_article_feature_img",
        verbose_name="Feature Image",
    )
    content = RichTextField(
        features=settings.RICH_TEXT_FEATURE_TYPE_A,
        verbose_name="Main Content",
    )

    tags = ClusterTaggableManager(
        through='article.ArticleTag', blank=True,
        help_text="Press Enter to insert new Tag",
    )

    base_panel = [
        FieldPanel('title'),
        FieldPanel('content'),
    ]
    article_settings = [
        ImageChooserPanel('feature_img'),
        FieldPanel('tags'),
        FieldPanel('owner'),
        FieldPanel('like_count'),
        FieldPanel('hit_count'),
    ]

    edit_handler = TabbedInterface([
        ObjectList(base_panel, heading='Write Article'),
        ObjectList(article_settings, heading='Article Settings', classname="settings"),
        ObjectList(Page.promote_panels, heading='Promote'),
        ObjectList(Page.settings_panels, heading='Publish Settings', classname="settings"),
    ])

    def serve(self, request, *args, **kwargs):
        self_as_obj = self.__class__.objects.filter(id=self.id)
        self_as_obj.update(hit_count=F('hit_count') + 1)
        return super().serve(request, *args, **kwargs)

    def get_context(self, request, *args, **kwargs):
        context = super(ArticlePage, self).get_context(request, *args, **kwargs)
        # context['home_page'] = HomePage.objects.first()
        context['all_article_page'] = ArticleIndexPage.objects.first()
        return context


class ArticleTag(TaggedItemBase):
    content_object = ParentalKey('ArticlePage', related_name='article_tags')


@register_snippet
class Tag(TaggitTag):
    class Meta:
        proxy = True


