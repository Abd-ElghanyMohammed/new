# استخدم صورة PHP مع Apache
FROM php:8.2-apache

# نسخ ملفات المشروع للمسار بتاع Apache
COPY . /var/www/html/

# إعداد صلاحيات
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# تفعيل mod_rewrite (لو محتاج Laravel أو routing)
RUN a2enmod rewrite

# إضافة ServerName عشان نحل مشكلة التحذير
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# المنفذ اللي هيشتغل عليه
EXPOSE 8080

# نخلي Apache يشتغل على 8080 بدل 80
RUN sed -i 's/80/8080/g' /etc/apache2/ports.conf /etc/apache2/sites-available/000-default.conf

# بدء Apache
CMD ["apache2-foreground"]
