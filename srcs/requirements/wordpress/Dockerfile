FROM debian:bookworm

RUN apt-get update && apt-get install -y ca-certificates php-fpm php-mysql curl mariadb-client && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && \
    mkdir -p /run/php /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf
COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /var/www/wordpress

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
