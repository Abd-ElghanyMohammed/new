# Use official PHP image with Apache
FROM php:8.2-apache

# Copy project files to web root
COPY . /var/www/html/

# Enable mysqli extension
RUN docker-php-ext-install mysqli

# Expose port 8080
EXPOSE 8080
