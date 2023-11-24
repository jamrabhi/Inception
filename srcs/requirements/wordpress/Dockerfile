FROM debian:bullseye

RUN apt update &&\
	apt upgrade &&\
    apt install -y php7.4 \
                    php-fpm \
                    php-mysql \
                    mariadb-client \
                    wget

#WP CONF
RUN wget https://fr.wordpress.org/wordpress-6.4-fr_FR.tar.gz -P /var/www/jamrabhi && \
	tar -xvf /var/www/jamrabhi/wordpress-6.4-fr_FR.tar.gz -C /var/www/jamrabhi/ && \
    rm /var/www/jamrabhi/wordpress-6.4-fr_FR.tar.gz