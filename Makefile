all: volumes
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re: fclean all

volumes:
	mkdir -p $$HOME/data/wordpress/;
	mkdir -p $$HOME/data/mariadb/;

fclean: clean
	- sudo rm -rf $$HOME/data;

clean:
	- docker stop $$(docker ps -a -q)
	- docker rm $$(docker ps -a -q)
	- docker rmi $$(docker images -q)
	- docker volume rm $$(docker volume ls -q)
	- docker network rm $$(docker network ls -q)
	- docker system prune -a -f
