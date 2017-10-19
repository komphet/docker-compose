FROM php:7-apache

ADD ./000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN apt-get update && apt-get install -y libmcrypt-dev mysql-client \
    && docker-php-ext-install mcrypt pdo_mysql
# Install GD
RUN apt-get install vim zip -y
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN a2enmod rewrite

#RUN cd /var/www/laravel && composer install

COPY ./config/php.ini /usr/local/etc/php/

# Install Cron
RUN apt-get install cron -y && service cron start

WORKDIR /var/www/laravel
