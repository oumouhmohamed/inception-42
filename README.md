*This project has been created as part of the 42 curriculum by mooumouh.*

# Inception

## Description

This project sets up a small infrastructure with three dedicated containers:

- NGINX with TLSv1.2/TLSv1.3 on port 443
- WordPress with PHP-FPM
- MariaDB for the WordPress database

The stack uses Docker Compose, Docker networks, and named volumes. The main goal is to replicate a lightweight production-like architecture while keeping each service isolated in its own container. It follows the core project rules of the 42 Inception assignment.

Compared with a virtual machine, Docker containers are lighter, faster to start, and easier to isolate. Environment variables are used for runtime configuration. Docker networks are preferred over host networking because they keep services logically separated. Named Docker volumes are used here with host storage in /home/mooumouh/data for persistence.

## Instructions

1. Ensure Docker and Docker Compose are installed.
2. Start the project:

```bash
make up
```

3. Stop the stack:

```bash
make down
```

4. Full cleanup:

```bash
make fclean
```

5. Open the website in a browser:

```text
https://mooumouh.42.fr
```

If local DNS is not configured, add this line to /etc/hosts:

```text
127.0.0.1 mooumouh.42.fr
```

## Resources

- Docker documentation: https://docs.docker.com/
- Docker Compose reference: https://docs.docker.com/compose/
- NGINX TLS configuration: https://nginx.org/en/docs/http/configuring_https_servers.html
- WordPress installation: https://wordpress.org/documentation/
- MariaDB documentation: https://mariadb.com/kb/en/documentation/

This project was built using AI assistance for structure planning, Docker configuration, and validation steps. The AI was used to draft the Compose file, service configuration, and documentation, and to verify runtime behavior with Docker commands.
