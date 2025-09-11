# Inception
In this project have use the docker and container for create the network the service that...

in this project use the docker for create the wordpress site host using tree containers, mariadb,nginx and wordpress container. Any containers is inicalizate use debian image for start and next step install the 
requerimentes for this container for example, in container the mariadb install the mariadb-client and 
mariadb server and use expecify bash script for configurate the data base before start container.


The project is structred this way:


mariadb -->  wordpress --3005 > nginx --443 > web

In folder /home/$USER/data seted for save the vulumes: 
  - vulume the database in folder /data/lib;
  - vulume the wordpress in folder /data/wordpress;


This project was projected for use the command make and configurate the /data/ createing the vulumes and start 
the site and wordpress inicalizate and configurate for start use.

  




















utilist comands:

docker rm -f $(docker ps -aq) --apagar container

this was not done :

por o data na pasta /home/$USER/data/; --feito

pro o host jperpect.42.fr; --feito

proteger as pasword; --feito

checar a falg latest;

por o doker compose na pasta srcs e o env;  --feito

mudar o o scrpt para a pasta tools do wordpress; --feito

cirirar .dockerignore em todos  os container;

por secrets no git ignore;

adicionar chek de erros no config da maria db; --feito

ver se o problea do loop e no login a base de dados --feito
