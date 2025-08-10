# syntax=docker/dockerfile:1

FROM debian:unstable-slim

WORKDIR /home
COPY . .
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN ls
CMD ["ls","-l"]
CMD [ "mysqld", "--user=mysql", "--console"]


