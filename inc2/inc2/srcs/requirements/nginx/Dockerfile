FROM debian:11

RUN apt update && \
	apt install -y nginx && \
	apt install -y openssl && \
	rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY ./tools/nginx.sh /home/nginx.sh
RUN chmod +x /home/nginx.sh

EXPOSE 443

ENTRYPOINT ["/home/nginx.sh"]
