from django.db import models

from modelcluster.fields import ParentalKey
from wagtail.admin.edit_handlers import FieldPanel, InlinePanel
from wagtail.core.models import Page, Orderable


class HomePage(Page):
    favicon = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Icon in title bar"
    )

    logo = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Max height fixed by CSS"
    )

    phone_number = models.CharField(blank=True, null=True, max_length=20)

    txt_ph_nmb = models.CharField(
        blank=True, null=True, max_length=150,
        help_text="Text below phone number in Top",
        verbose_name="Text below Phone No.(top)"
    )

    # banner
    banner_slogan = models.CharField(blank=True, null=True, max_length=150)
    banner_bg = models.ImageField(
        blank=True, null=True, upload_to='home/',
        help_text="Background Image of Banner"
    )
    banner_qt_text = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="Text below QUOTE Form in Banner",
        verbose_name="Banner QUOTE Text",
    )

    qt_heading = models.CharField(
        blank=True, null=True, max_length=250,
        help_text="QUOTE Heading in Pop-up form",
        verbose_name="Quote Heading",
    )

    content_panels = Page.content_panels + [
        FieldPanel('favicon'), FieldPanel('logo'),
        FieldPanel('phone_number'), FieldPanel('txt_ph_nmb'),
        FieldPanel('banner_slogan'), FieldPanel('banner_bg'), FieldPanel('banner_qt_text'),
        FieldPanel('qt_heading'),
        InlinePanel('achievement_count', label="Achievement Name & Count"),
    ]


class AchievementCount(Orderable):
    page = ParentalKey(
        HomePage,
        on_delete=models.CASCADE,
        related_name='achievement_count'
    )

    name = models.CharField(max_length=50, help_text="Name of the Achievement")
    count = models.CharField(max_length=6, help_text="Achievement counts (eg: 5,000)")

    panels = [
        FieldPanel('name'),
        FieldPanel('count'),
    ]

