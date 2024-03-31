from django.contrib import admin
from .models import Book, Author
# Register your models here.
class BookAdmin(admin.ModelAdmin):
  prepopulated_fields = {"slug": ["title"]}
  list_filter = ("author", "rating")
  list_display = ("title", "author")

admin.site.register(Book, BookAdmin)

class AuthorAdmin(admin.ModelAdmin):
  prepopulated_fields = {"full_name": ["first_name", "last_name"]}

admin.site.register(Author, AuthorAdmin);