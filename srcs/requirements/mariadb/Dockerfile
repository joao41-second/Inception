FROM debian:unstable-slim

RUN apt-get update && apt-get install -y mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld \
    && chown -R mysql:mysql /run/mysqld /var/lib/mysql

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

USER mysql

CMD ["mysqld", "--console"]

