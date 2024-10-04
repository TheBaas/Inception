FROM debian:11

RUN apt update && apt install -y \
	vsftpd \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh

EXPOSE 20 21 21100-21110

ENTRYPOINT [ "/home/entrypoint.sh" ]