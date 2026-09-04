FROM debian:bookworm

RUN apt update && apt install -y mariadb-server && rm -rf /var/lib/apt/lists/* && rm -rf /var/lib/mysql/* 

COPY tools/scripte.sh /usr/local/bin/start-mariadb.sh

RUN chmod +x /usr/local/bin/start-mariadb.sh

RUN sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/usr/local/bin/start-mariadb.sh"]
