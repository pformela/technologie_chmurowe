#!/bin/bash

docker volume create nodejs_data
docker volume create all_volumes

docker run -d -p 3000:3000 --name zadanie2_nodejs -v nodejs_data:/app -v all_volumes:/all_data node
docker exec -it zadanie2_nodejs cd /app; touch test1.txt
docker exec -it zadanie2_nodejs cd /app; touch test2.txt
docker exec -it zadanie2_nodejs cd /app; touch test3.txt
docker exec -it zadanie2_nodejs cp /app/* /all_data


docker run -d -p 80:80 --name zadanie1_nginx -v zadanie1:/usr/share/nginx/html -v all_volumes:/all_data nginx
docker exec -it zadanie1_nginx cp /usr/share/nginx/html/* /all_data

ls -la /var/lib/docker/volumes/all_volumes/_data

# XXX   Napisz skrypt, który utworzy wolumin nodejs_data, 
# XXX   a następnie uruchomi kontener Node.js z tym woluminem zamontowanym w katalogu /app. 
# XXX   Następnie utwórz wolumen o nazwie all_volumes 
# i korzystając z wcześniej utworzonego wolumenu nginx_data, skopiuj pliki z katalogu /usr/share/nginx/html do woluminu all_volumes 
# oraz pliki z katalogu app do woluminu all_volumes z poziomu kontenera. 