#!/bin/sh

if [ ! -f $SSL_KEY ]; then
	mkdir -p /etc/ssl/private /etc/ssl/certs && \
	openssl req -newkey rsa:2048 -nodes -x509 -days 365 \
	-keyout $SSL_KEY \
	-out $SSL_CRT \
	-subj "/C=NL/ST=North-Holland/L=Amsterdam/O=kaltevog/CN=$DOMAIN_NAME"
fi

nginx -g "daemon off;"