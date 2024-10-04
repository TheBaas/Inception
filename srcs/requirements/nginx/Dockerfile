FROM debian:oldstable

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

# Create self-signed SSL certificate
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=NL/ST=NorthHolland/L=Amsterdam/O=42/OU=42/CN=localhost/UID=kaltevog"
#dont forget to change localhost here! to kaay.42.fr

EXPOSE 443

COPY conf/default.conf /etc/nginx/conf.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]
