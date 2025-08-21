# syntax=docker/dockerfile:1
FROM debian:bullseye


RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-mysqli \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-zip \
    php7.4-bcmath \
    php7.4-json \
    php7.4-opcache \
    wget \
    curl \
    mariadb-client \
    && rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz
workdir /var/www/html
COPY ./conf/config.sh ../config.sh 
EXPOSE 9000
ENTRYPOINT ["sh","../config.sh"]

