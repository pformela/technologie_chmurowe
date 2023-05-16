#!/bin/bash

docker network create --subnet=192.168.1.0/24 --gateway=192.168.1.1 my_bridge
docker run -d --name=zadanie1 --interactive -t --network=my_bridge alpine
docker exec zadanie1 ping -c 3 192.168.1.1

docker stop zadanie1
docker rm zadanie1
docker network rm my_bridge