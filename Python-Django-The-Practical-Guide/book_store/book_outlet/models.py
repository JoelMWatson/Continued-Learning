from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.urls import reverse
from django.utils.text import slugify

# Create your models here.
class Author(models.Model):
  first_name = models.CharField(max_length=100)
  last_name = models.CharField(max_length=100)
  full_name = models.CharField(max_length=201, blank=True)

  def __str__(self):
    return self.full_name
   
   
class Book(models.Model):
  title = models.CharField(max_length=50)
  rating = models.IntegerField(validators=[MinValueValidator(1),MaxValueValidator(5)])
  author = models.ForeignKey(Author, on_delete=models.CASCADE, null=True)
  is_best_seller = models.BooleanField(default=False)
  slug = models.SlugField(default="", null=False, db_index=True)
  
  def get_absolute_url(self):
      return reverse("book-detail", args=[self.slug])
  
  def __str__(self):
    return f"{self.title} ({self.rating})"

  def save(self, *args, **kwargs):
     self.slug = slugify(self.title)
     super().save(*args, **kwargs)