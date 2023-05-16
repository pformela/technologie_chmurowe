#!/bin/bash

docker compose build --no-cache
docker compose up -d
docker cp ./database/restaurants.json database:/restaurants.json
docker exec -it database mongoimport --db zadanie3 --collection restaurants --file /restaurants.json