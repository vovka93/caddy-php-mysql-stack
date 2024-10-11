# Base image for PHP
FROM php:8.1-fpm

# Install system dependencies for MySQL and PHP extensions
RUN apt-get update && apt-get install -y \
   libonig-dev \
   libxml2-dev \
   libpng-dev \
   libjpeg-dev \
   libfreetype6-dev \
   zip \
   unzip \
   git \
   curl \
   libzip-dev \
   && docker-php-ext-install pdo_mysql mysqli mbstring exif pcntl bcmath gd zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application code
COPY . .

# Start PHP-FPM
CMD ["php-fpm"]
