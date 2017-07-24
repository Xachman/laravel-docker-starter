FROM php:7.1.7-apache

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql zip

RUN sed -i 's!/var/www/html!/var/www/site/public!g' /etc/apache2/sites-available/000-default.conf