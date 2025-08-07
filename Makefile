

nginx:
	docker build -t debian ./srcs/requirements/nginx/

maria:
	docker build -t debian ./srcs/requirements/mariadb/


run:
	docker run debian
