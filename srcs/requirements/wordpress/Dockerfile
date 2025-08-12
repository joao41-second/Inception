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


RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzf latest.tar.gz
workdir /wordpress
COPY ./conf/config.sh ../config.sh 

ENTRYPOINT ["sh","../config.sh"]

