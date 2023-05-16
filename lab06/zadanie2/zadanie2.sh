#!/bin/bash

docker-compose up -d
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zadanie2_web_1)

echo $ip