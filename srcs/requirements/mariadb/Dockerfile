# syntax=docker/dockerfile:1

FROM debian:unstable-slim

WORKDIR /home

COPY . .
RUN apt-get update
RUN apt-get -y install mariadb-server
RUN systemctl start mariadb
RUN systemctl enable mariadb
RUN ls
#RUN chmod +x start.sh
CMD ["ls","-l"]
