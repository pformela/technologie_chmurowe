#!/bin/bash

docker compose build --no-cache
docker compose up -d

sleep 2

curl -X POST localhost:3000/messages -H 'Content-Type: application/json' -d '{"message": "wiadomosc 1"}'
curl -X POST localhost:3000/messages -H 'Content-Type: application/json' -d '{"message": "wiadomosc 2"}'
curl -X POST localhost:3000/messages -H 'Content-Type: application/json' -d '{"message": "wiadomosc 3"}'
