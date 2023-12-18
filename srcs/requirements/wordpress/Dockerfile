FROM debian:bullseye

RUN apt update &&\
	apt upgrade &&\
    apt install -y php7.4 \
                    php-fpm \
                    php-mysql \
                    mariadb-client \
                    curl

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www/jamrabhi/wordpress

RUN mkdir /run/php/

COPY conf/conf.sh /

RUN	chown -R root:root /var/www/jamrabhi/wordpress/

ENTRYPOINT ["sh", "/conf.sh"]
