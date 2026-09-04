*This project has been created as part of the 42 curriculum by mooumouh.*

# Inception

## Description

Inception is a system administration project using Docker.

The project creates a small infrastructure in a virtual machine using Docker Compose. Each service runs in its own dedicated container and each image is built from a custom Dockerfile.

The mandatory stack contains:

- NGINX with TLSv1.2 or TLSv1.3 only.
- WordPress with PHP-FPM only, without NGINX.
- MariaDB only, without NGINX.
- One Docker named volume for the WordPress database.
- One Docker named volume for the WordPress website files.
- One Docker network connecting the containers.
- A restart policy so containers restart in case of a crash.
- NGINX as the only entry point through port 443.

The two persistent volumes must remain Docker named volumes and their data must be stored under:

```text
/home/mooumouh/data
```

The project domain must be:

```text
mooumouh.42.fr
```

### Main design choices

#### Virtual Machines vs Docker

A virtual machine virtualizes a complete machine and operating system.

Docker runs isolated containers for the required services. In this project, each service runs in its own dedicated container and the complete infrastructure runs inside a virtual machine.

#### Secrets vs Environment Variables

Environment variables are used to configure the services.

A `.env` file is mandatory for environment variables.

Credentials, passwords, API keys, and other confidential information must not be committed to Git. Docker secrets are strongly recommended for confidential information.

#### Docker Network vs Host Network

The project uses a Docker network to connect the containers.

Host networking is forbidden. `network: host`, `--link`, and `links:` must not be used.

#### Docker Volumes vs Bind Mounts

The mandatory WordPress database and website storage must use Docker named volumes.

Direct bind mounts are not allowed for these two persistent storages.

The named volumes must be configured so that their data ends up under `/home/mooumouh/data` on the host while remaining Docker named volumes.

## Instructions

### Prerequisites

The project must be run inside a virtual machine with Docker and Docker Compose available.

All configuration files must be inside the `srcs` directory.

The `Makefile` must be located at the root of the repository and must build and launch the complete application using `docker-compose.yml`.

### Configuration

Configure the local domain so that:

```text
mooumouh.42.fr
```

points to the local IP address.

Create and configure the local `.env` file required by the project.

Do not commit credentials or passwords to Git.

### Build and launch

From the repository root, run:

```bash
make
```

The Makefile must build the required Docker images and launch the infrastructure with Docker Compose.

### Access

The infrastructure must be accessible only through NGINX on:

```text
https://mooumouh.42.fr
```

using port `443` and TLSv1.2 or TLSv1.3.

## Resources

References used while working on the project should be listed here, for example:

- Docker documentation
- Docker Compose documentation
- NGINX documentation
- MariaDB documentation
- WordPress documentation
- PHP-FPM documentation

### AI usage

AI was used as a learning and review tool for:

- Understanding Docker, Dockerfiles, containers, networks, and volumes.
- Understanding MariaDB initialization and SQL commands.
- Understanding WordPress, PHP-FPM, and WP-CLI configuration.
- Understanding NGINX and TLS configuration.

