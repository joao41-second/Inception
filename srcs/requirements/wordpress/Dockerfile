# syntax=docker/dockerfile:1

FROM debian:unstable-slim
WORKDIR /home
COPY . .
RUN apt-get update
RUN apt-get -y install nginx
CMD ["ls","-l"]
CMD ["nginx","-v"]
