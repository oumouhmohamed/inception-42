COMPOSE = docker compose -f srcs/docker-compose.yml
DATA = /home/mooumouh/data

all: up

up:
	mkdir -p $(DATA)/wordpress
	mkdir -p $(DATA)/mariadb
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

clean:
	$(COMPOSE) down -v --rmi all
	sudo rm -rf $(DATA)/wordpress/*
	sudo rm -rf $(DATA)/mariadb/*

fclean: clean

re: fclean all

.PHONY: all up down clean fclean re