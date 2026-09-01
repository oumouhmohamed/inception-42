# Developer Documentation

## Prerequisites

- Docker
- Docker Compose
- Linux environment with sufficient permissions to manage Docker and edit /etc/hosts

## Setup from scratch

Create the host data directories used for persistence:

```bash
mkdir -p /home/root/data/mariadb /home/root/data/wordpress
```

Add the local hostname mapping:

```bash
echo "127.0.0.1 hp.42.fr" | sudo tee -a /etc/hosts
```

Build and start the project:

```bash
make up
```

## Useful commands

```bash
make down
make re
make fclean

docker compose --env-file srcs/.env -f srcs/docker-compose.yml ps

docker compose --env-file srcs/.env -f srcs/docker-compose.yml logs -f

docker volume ls
```

## Persistence and data location

The project stores its persistent data under:

- /home/root/data/mariadb
- /home/root/data/wordpress

These are managed via Docker named volumes and remain available across container restarts and rebuilds.
