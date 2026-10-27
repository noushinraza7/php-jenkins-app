FROM php:8.4-apache

WORKDIR /var/www/html

COPY scr/index.php /var/www/html/index.php

EXPOSE 80
