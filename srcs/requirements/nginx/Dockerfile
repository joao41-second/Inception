# syntax=docker/dockerfile:1

FROM debian:unstable-slim
WORKDIR /home
RUN apt-get update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \ 
    -keyout /etc/ssl/private/aouhadou.key \
    -out /etc/ssl/certs/aouhadou.crt \
    -subj="/C=PT/ST=Porto/L=Porto/O=42 School/OU=aouhadou/CN=jperpect.42.fr"
COPY ./tools/default /etc/nginx/sites-available/default
CMD ["cat",/etc/ssl/private/aouhadou.key]
CMD ["nginx","-g","daemon off;"]
EXPOSE 443
EXPOSE 80
