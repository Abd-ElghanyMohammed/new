FROM php:8.2-apache

# انسخ ملفات مشروعك داخل Apache web root
COPY . /var/www/html/

# تأكد من الصلاحيات
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# انسخ إعدادات Apache
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# فعل mod_rewrite لو محتاجه
RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
