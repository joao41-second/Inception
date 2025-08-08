# syntax=docker/dockerfile:1

FROM debian:unstable-slim

WORKDIR /homej
COPY . .
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN systemctl enable mariadb.service
RUN systemctl start mariadb.service
RUN ls
CMD ["ls","-l"]
