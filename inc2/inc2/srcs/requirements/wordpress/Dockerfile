FROM debian:11

RUN apt update && apt install -y \
	php \
	php-mysql \
	php-fpm \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip \
	curl \
	wget \
	&& rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp-init.sh /home/wp-init.sh
RUN chmod +x /home/wp-init.sh
RUN mkdir /run/php

EXPOSE 9000

CMD ["/home/wp-init.sh"]