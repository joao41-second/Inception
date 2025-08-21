all:
	cd ./srcs/  && docker compose up --build 

r_maria:
	docker run  -p 443:443 -p 3306:3306 maria

enter_mariadb_db:
	docker exec -it mariadb mysql -u root -p
enter_mariadb_docker:
	docker exec -it mariadb bash
enter_mariadb_nginx:
	docker exec -it nginx bash
enter_worpress:
	docker exec -it wordpress bash

clean:
	rm -fr /home/$USER/data
	docker container prune
	docker image prune
	docker system prune
