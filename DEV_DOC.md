# DEV_DOC

## Set up the environment from scratch

The project must run inside a virtual machine.

Required tools:

- Docker
- Docker Compose
- Make

The repository must contain:

```text
Makefile
srcs/
srcs/docker-compose.yml
srcs/.env
srcs/requirements/
```

Each mandatory service must have its own Dockerfile and dedicated container.

The mandatory services are:

```text
nginx
wordpress
mariadb
```

The images must be built by the project itself from the penultimate stable version of Debian or Alpine. Ready-made service images are forbidden.

Only Debian or Alpine may be used as the base image exception allowed by the subject.

## Configuration

Configure the domain:

```text
mooumouh.42.fr
```

so that it points to the local IP address.

The project must use a `.env` file for environment variables.

Credentials, passwords, API keys, and other confidential information must not be committed to Git.

Docker secrets are strongly recommended for confidential information.

## Build and launch

From the repository root:

```bash
make
```

The Makefile must build the images and launch the complete application using:

```text
srcs/docker-compose.yml
```

## Manage containers

Check running services:

```bash
docker compose -f srcs/docker-compose.yml ps
```

Stop the infrastructure:

```bash
docker compose -f srcs/docker-compose.yml down
```

Inspect service logs when needed:

```bash
docker compose -f srcs/docker-compose.yml logs
```

The containers must restart in case of a crash.

The project must not use:

- `network: host`
- `--link`
- `links:`
- `tail -f`
- `sleep infinity`
- `while true`
- other infinite-loop hacks used only to keep containers alive

## Network

A Docker network must connect the containers.

NGINX must be the only entry point to the infrastructure through:

```text
443
```

using TLSv1.2 or TLSv1.3 only.

## Persistent data

The mandatory project requires two Docker named volumes:

1. A volume for the WordPress database.
2. A volume for the WordPress website files.

Direct bind mounts are not allowed for these two persistent storages.

The named volumes must be configured so that their data ends up under:

```text
/home/mooumouh/data
```

on the host machine while remaining Docker named volumes.

The database and website data must persist independently of the containers.
