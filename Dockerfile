# Use official PHP + Apache
FROM php:8.2-apache

# Install extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable mod_rewrite
RUN a2enmod rewrite

# Copy project files
COPY . /var/www/html/

# Copy custom apache config
COPY apache.conf /etc/apache2/sites-available/000-default.conf

# Expose port 80 (default for web)
EXPOSE 80

CMD ["apache2-foreground"]
