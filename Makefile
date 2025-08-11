all:
	docker compose up --build

d_maria:
	docker build -t maria ./srcs/requirements/mariadb/
r_maria:
	docker run  -p 443:443 -p 3306:3306 maria



clean:
	docker container prune
	docker image prune
	docker system prune
