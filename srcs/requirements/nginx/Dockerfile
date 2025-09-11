# syntax=docker/dockerfile:1

FROM debian:bullseye
WORKDIR /home
RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/jperpect.key \
    -out /etc/ssl/certs/jperpect.crt \
    -subj="/C=PT/ST=Porto/L=Porto/O=42 School/OU=aouhadou/CN=jperpect.42.fr"

COPY ./tools/default /etc/nginx/sites-available/default
RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 755 /var/www/html/

ENTRYPOINT ["nginx","-g","daemon off;"]
EXPOSE 443
