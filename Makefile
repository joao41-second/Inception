nginx:
	docker build -t debian ./srcs/requirements/nginx/
maria:
	docker build -t debian ./srcs/requirements/mariadb/
run_name:
	docker run --name nginx -p 443:443 debian
run:
	docker run  -p 443:443 -p 80:80 debian
