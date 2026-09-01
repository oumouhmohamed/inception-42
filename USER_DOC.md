# User Documentation

## What services are provided?

This stack provides three services:

- NGINX serves the website over HTTPS on port 443.
- WordPress runs the site with PHP-FPM.
- MariaDB stores the WordPress database.

## Start and stop the project

To launch the stack:

```bash
make up
```

To stop it:

```bash
make down
```

## Access the website

Open the following URL in your browser:

```text
https://hp.42.fr
```

If the domain does not resolve locally, add this line to /etc/hosts:

```text
127.0.0.1 hp.42.fr
```

## Credentials

The credentials are stored in the local .env file inside the project and should never be committed to Git.

The administrator username is intentionally not `admin` or `administrator`.

## Service health checks

Check that all containers are running:

```bash
docker compose --env-file srcs/.env -f srcs/docker-compose.yml ps
```

Read the logs if needed:

```bash
docker compose --env-file srcs/.env -f srcs/docker-compose.yml logs -f
```
