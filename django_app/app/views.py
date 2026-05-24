import copy
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.db.models import Q
from django.core.paginator import Paginator

from app.forms import LoginForm, ProductForm
from app.models import Product, Producers, Users


def get_user_role(user):
    """
    Определяет роль пользователя.
    Возвращает: 'admin', 'manager', 'user' или 'guest'.
    """
    if not user.is_authenticated:
        return 'guest'
    if user.is_superuser:
        return 'admin'
    if user.is_staff: # Обычно менеджеры имеют is_staff=True
        return 'manager'
    return 'user'


def login_page(request):
    """Страница авторизации"""
    if request.method == 'POST':
        form = LoginForm(request.POST)
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, f'Добро пожаловать, {user.get_full_name() or user.username}!')
            return redirect('main:products')
        else:
            messages.error(request, 'Неверное имя пользователя или пароль.')
    else:
        form = LoginForm()

    return render(
        request,
        'login.html',
        {
            'title': 'Авторизация',
            'form': form,
        }
    )


def logout_page(request):
    """Выход из системы"""
    logout(request)
    messages.success(request, 'Вы успешно вышли из системы.')
    return redirect('main:login')


def products_page(request):
    """Каталог товаров (Главная страница)"""
    user_role = get_user_role(request.user)

    # Базовый запрос с оптимизацией (выборка связанных таблиц)
    products_qs = Product.objects.select_related('product_type', 'producer', 'unit').all()

    # Поиск и фильтрация доступны только для авторизованных пользователей с ролями manager/admin
    if user_role in ['manager', 'admin']:
        search_value = request.GET.get('search', '')
        producer_filter = request.GET.get('producer', '')
        sort_by = request.GET.get('sort', 'name-asc')

        # Фильтрация по поиску
        if search_value:
            products_qs = products_qs.filter(
                Q(name__icontains=search_value) |
                Q(description__icontains=search_value) |
                Q(producer__name__icontains=search_value)
            )

        # Фильтрация по поставщику
        if producer_filter:
            products_qs = products_qs.filter(producer__name=producer_filter)

        # Сортировка (Match-case требует Python 3.10+)
        match sort_by:
            case 'name-asc':
                products_qs = products_qs.order_by('name')
            case 'name-desc':
                products_qs = products_qs.order_by('-name')
            case 'price-asc':
                products_qs = products_qs.order_by('price')
            case 'price-desc':
                products_qs = products_qs.order_by('-price')
            case _:
                products_qs = products_qs.order_by('name') # Дефолтная сортировка
    else:
        # Для гостей сортировка и поиск не применяются
        sort_by = ''
        search_value = ''
        producer_filter = ''


    # Пагинация (10 товаров на страницу)
    paginator = Paginator(products_qs, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    brand = Producers.objects.all() # Для выпадающего списка фильтра

    return render(
        request,
        'products.html',
        {
            'title': 'Каталог товаров',
            'user_role': user_role,
            'page_obj': page_obj,
            'brand': brand,
            'sort_by': sort_by,
            'search_value': search_value,
            'brand_filter': producer_filter,
        }
    )


@login_required
def product_create_page(request):
    """Добавление нового товара (Доступно только Администратору)"""
    if not request.user.is_superuser:
        messages.error(request, 'Недостаточно прав для добавления товара.')
        return redirect('main:products')

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Товар добавлен успешно!')
            return redirect('main:products')
    else:
        form = ProductForm()

    return render(
        request,
        'product.html',
        {
            'title': 'Добавление товара',
            'form': form,
            'action': 'create',
        }
    )


@login_required
def product_update_page(request, pk):
    """Редактирование существующего товара (Доступно только Администратору)"""
    if not request.user.is_superuser:
        messages.error(request, 'Недостаточно прав для редактирования товара.')
        return redirect('main:products')

    product = get_object_or_404(Product, pk=pk)

    if request.method == 'POST':
        form = ProductForm(request.POST, request.FILES, instance=product)
        if form.is_valid():
            # Обработка удаления старого изображения при загрузке нового или очистке поля
            old_image = product.image
            new_image = request.FILES.get('image')

            if new_image and old_image and old_image != new_image:
                old_image.delete(save=False)

            form.save()
            messages.success(request, 'Товар обновлен успешно!')
            return redirect('main:products')
    else:
        form = ProductForm(instance=product)

    return render(
        request,
        'product_form.html',
        {
            'title': f'Редактирование: {product.name}',
            'form': form,
            'action': 'update',
            'product': product,
        }
    )


@login_required
def product_delete(request, pk):
    """Удаление товара (Доступно только Администратору)"""
    if not request.user.is_superuser:
        messages.error(request, 'Недостаточно прав для удаления товара.')
        return redirect('main:products')

    product = get_object_or_404(Product, pk=pk)
    
    # Сохраняем имя для сообщения перед удалением, так как объект будет уничтожен
    product_name = product.name

    # Удаляем файл изображения с диска перед удалением модели из БД
    if product.image:
        product.image.delete(save=False)
    
    product.delete()
    
    messages.success(request, f'Товар "{product_name}" успешно удален!')
    return redirect('main:products')