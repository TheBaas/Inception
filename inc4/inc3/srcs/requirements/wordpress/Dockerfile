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
	iputils-ping \
	&& rm -rf /var/lib/apt/lists/*

# Download and setup WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy PHP-FPM configuration and WordPress initialization script
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/wp-init.sh /home/wp-init.sh

# Set execution permissions for WordPress initialization script
RUN chmod +x /home/wp-init.sh
RUN mkdir /run/php

EXPOSE 9000

# Set the default command to execute the WordPress initialization script
CMD ["/home/wp-init.sh"]