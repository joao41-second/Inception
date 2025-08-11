FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf

copy ./tools/config.sh ./config.sh

CMD ["ls"]
ENTRYPOINT ["sh","./config.sh"]
EXPOSE 3306



