from django.contrib import admin
from .models import (
    AuthGroup,
    AuthUser,
    Order,
    OrderContent,
    PickupPoints,
    Producers,
    Product,
    ProductType,
    Providers,
    Roles,
    Units,
    Users
    )

# Register your models here.

@admin.register(AuthUser)
class AuthUserAdmin(admin.ModelAdmin):
    list_display = ('username', 'email', 'is_staff', 'is_active')
    search_fields = ('username', 'email', 'name')
    list_filter = ('is_staff', 'is_active')

@admin.register(AuthGroup)
class AuthGroupAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)

# --- Каталог товаров ---

@admin.register(Producers)
class ProducersAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)

@admin.register(Providers)
class ProvidersAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)

@admin.register(ProductType)
class CakeCategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')
    search_fields = ('name',)

@admin.register(Product)
class ProductsAdmin(admin.ModelAdmin):
    list_display = ('id','article', 'name', 'price', 'producer', 'product_type', 'quantity')
    search_fields = ('article', 'name', 'description')
    list_filter = ('producer', 'product_type')

# --- Заказы ---

@admin.register(Order)
class OrderImportAdmin(admin.ModelAdmin):
    list_display = ('id', 'order_date', 'delivery_date', 'user', 'status', 'code')
    search_fields = ('id', 'code')
    list_filter = ('order_date', 'status', 'user')

@admin.register(OrderContent)
class OrderContentAdmin(admin.ModelAdmin):
    list_display = ('order', 'article', 'quantity')
    search_fields = ('id', 'article')
# --- Справочники ---

@admin.register(Units)
class UnitsAdmin(admin.ModelAdmin):
    list_display = ('id', 'unit')

@admin.register(Roles)
class UserCategoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'name')

@admin.register(Users)
class UsersAdmin(admin.ModelAdmin):
    list_display = ('id', 'email', 'full_name', 'role')
    search_fields = ('email', 'full_name')

@admin.register(PickupPoints)
class PickupPointsAdmin(admin.ModelAdmin):
    list_display = ('id', 'postcode', 'city', 'street', 'building')
    search_fields = ('city', 'street')