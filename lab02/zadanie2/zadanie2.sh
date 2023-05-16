#!/bin/bash

docker build -t zadanie2 . 
docker run -d -P -p 8080:8080 --name zadanie2 zadanie2

sleep 3

response=$(curl -s http://localhost:8080)

echo $response

res_regex=".*((([01][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])).*"

if [[ $response =~ $res_regex ]]; then
    echo "Test passed"
else
    echo "Test failed"
fi