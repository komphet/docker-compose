FROM php:7.1-apache

RUN apt-get -y update && apt-get install -y libmcrypt-dev mysql-client \
    && docker-php-ext-install mcrypt pdo_mysql mysqli
# Install GD
RUN apt-get install zip -y
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN a2enmod rewrite

WORKDIR /var/www/html
