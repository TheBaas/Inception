FROM debian:11

RUN apt update && apt install -y \
	redis-server

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
