FROM debian:oldstable

RUN apt-get update -y && \
    apt-get install -y wget curl php php-mysqli php-fpm netcat

# Install the wordpress CLI and makes wp command available
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

RUN rm -rf /var/www/html/*

# Download and extract the latest version of wordpress and remove the archive
RUN wget http://wordpress.org/latest.tar.gz && \
    tar xfz latest.tar.gz && \
    rm -rf latest.tar.gz

# Move the content of the wordpress folder to the current directory and change the owner of the files
# to www-data wich is the user that the php-fpm process will run as
RUN mv wordpress/* . && chown -R www-data:www-data /var/www/html

RUN rm -rf wordpress

COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/setup.sh /
RUN chmod +x /setup.sh

EXPOSE 9000

CMD [ "bash", "/setup.sh" ]

# ENTRYPOINT [ "tail", "-f", "/dev/null" ]