FROM debian:bullseye

RUN apt update &&\
	apt upgrade &&\
	apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

#MYSQL CONF
RUN service mariadb start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS SQL_DATABASE;" && \
	mysql -e "CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'pass';" && \
	mysql -e "GRANT ALL PRIVILEGES ON SQL_DATABASE.* TO 'admin'@'%'" && \
	mysql -e "FLUSH PRIVILEGES" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'SQL_ROOT_PASSWORD';" &&\
    mysqladmin -u root -pSQL_ROOT_PASSWORD shutdown

ENTRYPOINT ["mysqld"]