COMPOSE_FILE = srcs/docker-compose.yml
VOLUME_DIR_DB=/home/kaltevog/data/mariadb
VOLUME_DIR_WP=/home/kaltevog/data/wordpress

all: up

up:
	@mkdir -p $(VOLUME_DIR_DB)
	@mkdir -p $(VOLUME_DIR_WP)
	docker-compose -f $(COMPOSE_FILE) up --build -d

re: fclean all

logs:
	docker-compose -f $(COMPOSE_FILE) logs

clean:
	docker-compose -f $(COMPOSE_FILE) down

fclean:
	docker-compose -f $(COMPOSE_FILE) down -v --rmi all
	@sudo rm -rf $(VOLUME_DIR_DB)
	@sudo rm -rf $(VOLUME_DIR_WP)

.PHONY: all up re clean fclean