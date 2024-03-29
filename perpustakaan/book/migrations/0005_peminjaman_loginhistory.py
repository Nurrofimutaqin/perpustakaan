# Generated by Django 4.2.8 on 2024-01-02 12:44

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('book', '0004_customuser_age'),
    ]

    operations = [
        migrations.CreateModel(
            name='Peminjaman',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tanggal_pinjam', models.DateField(auto_now_add=True)),
                ('tanggal_kembali', models.DateField(blank=True, null=True)),
                ('tanggal_pengembalian', models.DateField(null=True)),
                ('status', models.BooleanField(default=False)),
                ('buku', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='book.book')),
                ('member', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='LoginHistory',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
                ('successful', models.BooleanField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
