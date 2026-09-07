FROM debian:bookworm

RUN apt update && apt install -y mariadb-server && rm -rf /var/lib/mysql/* 

COPY tools/scripte.sh /usr/local/bin/start-mariadb.sh

RUN chmod +x /usr/local/bin/start-mariadb.sh

ENTRYPOINT ["/usr/local/bin/start-mariadb.sh"]
