

class SitemapUrlMixin:
    def get_sitemap_urls(self, request=None):
        return [
            {
                'location': self.get_full_url(request),
                'priority': '0.5',
                'changefreq': 'monthly',
                'lastmod': (self.last_published_at or self.latest_revision_created_at),
            }
        ]
