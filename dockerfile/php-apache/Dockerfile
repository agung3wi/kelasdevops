FROM php:7.4-apache

ADD https://raw.githubusercontent.com/mlocati/docker-php-extension-installer/master/install-php-extensions /usr/local/bin/

RUN chmod uga+x /usr/local/bin/install-php-extensions && sync \
    && install-php-extensions bz2 \
    gettext \
    intl \
    exif \
    pdo_pgsql \
    pdo_mysql \
    bcmath

COPY default.conf /etc/apache2/sites-enabled/000-default.conf

RUN a2enmod rewrite

WORKDIR /app

RUN chown www-data:www-data -R /app

EXPOSE 80
