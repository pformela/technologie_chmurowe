#!/bin/bash

cd mongo
docker build -t zadanie3_mongo .
docker run -d -p 27017:27017 --name zadanie3_mongo zadanie3_mongo
docker cp restaurants.json zadanie3_mongo:/restaurants.json
docker exec -it zadanie3_mongo mongoimport --db zadanie3 --collection restaurants --file /restaurants.json
mongo_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zadanie3_mongo)

cd ..
echo MONGODB_URI=mongodb://$mongo_ip:27017/zadanie3 > config.env
docker build -t zadanie3 . 
docker run -d -P -p 8080:8080 --name zadanie3 zadanie3

zadanie3_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zadanie3)

sleep 3

response=$(curl -v localhost:8080)

if jq -e . >/dev/null 2>&1 <<<"$response"; then
    echo "Test passed"
else
    echo "Test failed"
fi

