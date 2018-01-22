FROM php:5-apache

RUN apt-get update && apt-get install -y \ 
      && docker-php-ext-install mysqli \
      && docker-php-ext-install mysql 

RUN a2enmod rewrite expires