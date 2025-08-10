# syntax=docker/dockerfile:1

FROM debian:unstable-slim

WORKDIR /home
COPY . .
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN ls
RUN mkdir -p /run/mysqld
RUN chown mysql:mysql /run/mysqld
EXPOSE 3306
CMD ["ls","-l"]
CMD [ "mysqld", "--user=mysql", "--console"]

