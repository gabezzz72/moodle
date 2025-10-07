# Dockerfile
FROM php:8.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libxml2-dev unzip git libzip-dev && \
    docker-php-ext-install mysqli gd xml zip intl

# Enable Apache rewrite
RUN a2enmod rewrite

# Copy Moodle source
COPY . /var/www/html/

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 8080

CMD ["apache2-foreground"]
