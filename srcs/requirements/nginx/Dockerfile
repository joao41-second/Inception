# syntax=docker/dockerfile:1

FROM debian:unstable-slim
WORKDIR /home
RUN apt-get update
RUN apt-get -y install nginx
COPY ./tools/ /etc/
CMD ["nginx","-g","daemon off;"]
EXPOSE 443
EXPOSE 80
