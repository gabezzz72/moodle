# Use official PHP image with Apache
FROM php:8.1-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install necessary PHP extensions for Moodle (Postgres version)
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev libxml2-dev libpq-dev \
    zip unzip git curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pgsql pdo_pgsql opcache zip intl soap xmlrpc

# Set working directory
WORKDIR /var/www/html

# Copy Moodle source code
COPY . .

# ✅ Create the moodledata directory and set permissions properly
RUN mkdir -p /var/www/moodledata \
    && chown -R www-data:www-data /var/www/html /var/www/moodledata \
    && chmod -R 775 /var/www/html /var/www/moodledata

# ✅ Tell Moodle to use this data directory instead
ENV MOODLE_DATAROOT=/var/www/moodledata

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
