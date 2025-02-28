LIGTH_PURPLE	= \033[1;35m
RESET			= \033[0m

all: create_dirs up

create_dirs:
	@mkdir -p /home/$(USER)/data/mariadb
	@mkdir -p /home/$(USER)/data/wordpress
	@echo "${LIGTH_PURPLE}Data directories created.${RESET}"

re: fclean all

up:
	@echo "${LIGTH_PURPLE}Starting up containers...${RESET}"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build 
	@echo "${LIGTH_PURPLE}Done...${RESET}"

down:
	@echo "${LIGTH_PURPLE}Shutting down containers...${RESET}"
	@docker-compose -f ./srcs/docker-compose.yml down
	@echo "${LIGTH_PURPLE}Done...${RESET}"

clean: down
	@echo "${LIGTH_PURPLE}Cleaning up containers, volumes, and networks...${RESET}"
	@docker volume rm srcs_adminer_volume srcs_db_volume srcs_redis_volume srcs_wp_volume
	@sudo rm -rf /home/$(USER)/data/wordpress
	@sudo rm -rf /home/$(USER)/data/mariadb
	@echo "${LIGTH_PURPLE}Done...${RESET}"

fclean: clean
	@echo "${LIGTH_PURPLE}Removing Docker images...${RESET}"
	@docker rmi -f $(docker images -q)
	@echo "${LIGTH_PURPLE}Done...${RESET}"

.PHONY: all re up down create_dirs fclean clean