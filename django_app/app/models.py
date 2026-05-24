from django.db import models


class Acrticules(models.Model):
    id = models.IntegerField(primary_key=True)
    article = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'acrticules'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.BooleanField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.BooleanField()
    is_active = models.BooleanField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Order(models.Model):
    id = models.IntegerField(primary_key=True)
    order_date = models.DateField(blank=True, null=True)
    delivery_date = models.DateField(blank=True, null=True)
    pickup_point = models.ForeignKey('PickupPoints', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Users', models.DO_NOTHING, blank=True, null=True)
    code = models.IntegerField(blank=True, null=True)
    status = models.ForeignKey('OrderStatus', models.DO_NOTHING, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order'


class OrderContent(models.Model):
    id = models.IntegerField(primary_key=True)
    order = models.ForeignKey(Order, models.DO_NOTHING, blank=True, null=True)
    article = models.ForeignKey(Acrticules, models.DO_NOTHING, blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_content'


class OrderStatus(models.Model):
    id = models.IntegerField(primary_key=True)
    status = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'order_status'


class PickupPoints(models.Model):
    id = models.IntegerField(primary_key=True)
    postcode = models.IntegerField()
    city = models.CharField(blank=True, null=True)
    street = models.CharField(blank=True, null=True)
    building = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pickup_points'


class Producers(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'producers'


class Product(models.Model):
    id = models.IntegerField(primary_key=True)
    article = models.ForeignKey(Acrticules, models.DO_NOTHING, blank=True, null=True)
    name = models.TextField(blank=True, null=True)
    unit = models.ForeignKey('Units', models.DO_NOTHING, blank=True, null=True)
    price = models.IntegerField(blank=True, null=True)
    provider = models.ForeignKey('Providers', models.DO_NOTHING, blank=True, null=True)
    producer = models.ForeignKey(Producers, models.DO_NOTHING, blank=True, null=True)
    product_type = models.ForeignKey('ProductType', models.DO_NOTHING, blank=True, null=True)
    discount = models.IntegerField(blank=True, null=True)
    quantity = models.IntegerField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    img = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product'


class ProductType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'product_type'


class Providers(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'providers'


class Roles(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField()

    class Meta:
        managed = False
        db_table = 'roles'


class Units(models.Model):
    id = models.IntegerField(primary_key=True)
    unit = models.CharField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'units'


class Users(models.Model):
    id = models.IntegerField(primary_key=True)
    role = models.ForeignKey(Roles, models.DO_NOTHING)
    full_name = models.TextField(blank=True, null=True)
    email = models.CharField()
    password = models.CharField()

    class Meta:
        managed = False
        db_table = 'users'