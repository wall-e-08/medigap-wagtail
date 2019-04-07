from django.db import models


class Lead(models.Model):
    first_name = models.CharField(
        blank=True, null=True,
        max_length=100,
    )
    middle_name = models.CharField(
        blank=True, null=True,
        max_length=100,
    )
    last_name = models.CharField(
        blank=True, null=True,
        max_length=100,
    )
    email = models.EmailField(
        blank=True, null=True,
        max_length=200,
    )
    phone = models.CharField(
        blank=True, null=True,
        max_length=100,
        verbose_name="Phone number"
    )
    phone2 = models.CharField(
        blank=True, null=True,
        max_length=100,
        verbose_name="Alternate Phone number"
    )
    zip_code = models.CharField(
        blank=True, null=True,
        max_length=100,
    )
    dob = models.DateField(
        blank=True, null=True,
        verbose_name="Date of Birth",
    )
    created_time = models.DateTimeField(
        auto_now_add=True,
        verbose_name="Quote Time",
    )

    def get_name(self):
        return "{} {} {}".format(self.first_name, self.middle_name, self.last_name)

    def __str__(self):
        return self.get_name()





