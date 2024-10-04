FROM debian:11

RUN apt update && apt install -y lighttpd \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tools/* /var/www/html

EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]