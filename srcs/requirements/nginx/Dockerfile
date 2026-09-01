FROM debian:bookworm

RUN apt update && apt install -y nginx openssl && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes \
    -keyout /etc/ssl/private/inception.key \
    -out /etc/ssl/certs/inception.crt \
    -subj "/C=MA/ST=Khouribga/L=Khouribga/O=42/CN=mooumouh.42.fr"
#///etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

