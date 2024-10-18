# Base image for PHP
FROM php:8.1-fpm

# Install system dependencies for MySQL and PHP extensions
RUN apt-get update && apt-get install -y \
   libonig-dev \
   libxml2-dev \
   libfreetype6-dev \
   zip \
   unzip \
   git \
   curl \
   libzip-dev \
   && docker-php-ext-install pdo_mysql mysqli mbstring pcntl bcmath zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy timezone configration
COPY ./timezone.ini /usr/local/etc/php/conf.d/timezone.ini

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY . .

RUN chown -R www-data:www-data /var/www/html/public && chmod -R 755 /var/www/html/public

# Start PHP-FPM
CMD ["php-fpm"]
