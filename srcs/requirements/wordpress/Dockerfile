# syntax=docker/dockerfile:1
FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli zip pdo pdo_mysql

WORKDIR /var/www/html
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz --strip-components=1 \
    && rm wordpress.tar.gz

COPY ./conf/config.sh ./config.sh
RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000
ENTRYPOINT ["sh","./config.sh"]

