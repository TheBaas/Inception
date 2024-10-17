FROM debian:11

RUN apt update && apt install -y \
	dumb-init \
	mariadb-server \
	mariadb-client \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/init.sh /home/init.sh

RUN chmod +x /home/init.sh

EXPOSE 3306

ENTRYPOINT ["/home/init.sh"]