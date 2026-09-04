# USER_DOC

## Services provided by the stack

The mandatory infrastructure provides three services:

- NGINX: the only public entry point, using port 443 with TLSv1.2 or TLSv1.3.
- WordPress with PHP-FPM: the website application.
- MariaDB: the WordPress database.

The services communicate through a Docker network.

The WordPress database and website files are stored in persistent Docker named volumes.

## Start the project

From the root of the repository, run:

```bash
make
```

The root Makefile must build the Docker images and launch the complete infrastructure using Docker Compose.

## Stop the project

Stop the running infrastructure using the Docker Compose configuration from the project.

For example:

```bash
docker compose -f srcs/docker-compose.yml down
```

## Access the website

The project domain must point to the local IP address.

Open:

```text
https://mooumouh.42.fr
```

The website must be reached through NGINX on port 443 only.

## Access the WordPress administration panel

Open:

```text
https://mooumouh.42.fr/wp-admin
```

Use the WordPress administrator credentials configured locally for the project.

The administrator username must not contain `admin` or `administrator`, in any capitalization.

The WordPress database must contain at least two users, including one administrator.

## Credentials

Environment variables are stored in:

```text
srcs/.env
```

Credentials, passwords, API keys, and other confidential information must stay local and must not be committed to Git.

Docker secrets are strongly recommended for confidential information.

## Check that services are running

Use Docker Compose to check the project services:

```bash
docker compose -f srcs/docker-compose.yml ps
```

The mandatory services are:

```text
nginx
wordpress
mariadb
```

NGINX must be the only entry point exposed through port 443.
