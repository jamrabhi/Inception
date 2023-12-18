# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jamrabhi <jamrabhi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/07/10 03:13:41 by jamrabhi          #+#    #+#              #
#    Updated: 2023/10/20 01:50:36 by jamrabhi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRC_DIR = srcs

SRC_FILES =	docker-compose.yml

SRC = $(addprefix $(SRC_DIR)/,$(SRC_FILES))

all:
	docker compose -f ${SRC} up --build -d

stop:
	docker compose -f ${SRC} stop

down:
	docker compose -f ${SRC} down

clean: down
	docker system prune --volumes -af
	sudo rm -rf /home/jamrabhi/data/wordpress/*
	sudo rm -rf /home/jamrabhi/data/mariadb/*

re: clean
	@make all

.PHONY: all down clean re
