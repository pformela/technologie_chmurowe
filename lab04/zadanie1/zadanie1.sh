#!/bin/bash

docker volume create zadanie1
docker run -d -p 80:80 --name zadanie1_nginx -v zadanie1:/usr/share/nginx/html nginx

docker cp index.html zadanie1_nginx:/usr/share/nginx/html/index.html

sleep 1

res=$(curl -v localhost)
res_regex=".*Docker volumes.*"

if [[ $res =~ $res_regex ]]; then
    echo "Test 1 passed"
else
    echo "Test 1 failed"
fi

sleep 1

docker stop zadanie1_nginx
docker rm -f zadanie1_nginx

res2=$(cat /var/lib/docker/volumes/zadanie1/_data/index.html)

if [[ $res2 =~ $res_regex ]]; then
    echo "Test 2 passed"
else
    echo "Test 2 failed"
fi
