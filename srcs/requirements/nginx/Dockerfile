FROM debian:bullseye

RUN apt update &&\
	apt upgrade &&\
	apt install -y nginx\
	openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/L=Paris/O=42/CN=jamrabhi.42.fr"

#NGINX CONF
COPY conf/jamrabhi_conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/jamrabhi_conf /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	mkdir /var/www/jamrabhi

CMD ["nginx", "-g", "daemon off;"]