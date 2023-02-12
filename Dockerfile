FROM php:8.2.2-zts-alpine3.17

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions @composer oci8

ADD . /var/www/html

WORKDIR /var/www/html

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install


