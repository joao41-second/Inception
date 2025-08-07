#!/bin/bash

# Inicia o serviço MariaDB em background
/usr/bin/mysqld_safe &

# Dá um tempo para o MariaDB iniciar
sleep 5

# Manter o container rodando (modo simples)
tail -f /dev/null

