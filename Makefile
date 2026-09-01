all:
	mkdir -p /home/mooumouh/data/wordpress
	mkdir -p /home/mooumouh/data/mariadb
	docker compose -f srcs/docker-compose.yml up -d --build

up:
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down -v --rmi all
	sudo rm -rf /home/mooumouh/data/wordpress/*
	sudo rm -rf /home/mooumouh/data/mariadb/*

fclean: clean
	docker system prune -af

re: fclean all

.PHONY: re fclean clean down all
