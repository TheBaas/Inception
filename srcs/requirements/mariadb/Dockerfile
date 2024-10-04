FROM debian:oldstable

RUN apt-get update && apt-get install -y mariadb-server

COPY conf/setup.sh .

RUN chmod +x /setup.sh

EXPOSE 3306

CMD ["sh", "/setup.sh"]

# ENTRYPOINT [ "tail", "-f", "/dev/null" ]