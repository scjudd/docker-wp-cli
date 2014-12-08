FROM php:5.6-cli
MAINTAINER Spencer Judd <spencercjudd@gmail.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    less \
    mysql-client \
 && docker-php-ext-install \
    mysql \
    mbstring \
 && rm -rf /var/lib/apt/lists/* \
 && mkdir -p /var/www/html

WORKDIR /var/www/html
COPY wp /usr/local/bin/
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp-cli
RUN chmod +x /usr/local/bin/wp-cli
