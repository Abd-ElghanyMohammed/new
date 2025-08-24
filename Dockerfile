# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Copy project files to web root
COPY . /var/www/html/

# Enable mysqli
RUN docker-php-ext-install mysqli

# Set Apache to listen on the Railway port
ENV APACHE_RUN_PORT ${3306}

