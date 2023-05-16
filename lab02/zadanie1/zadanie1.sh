#!/bin/bash

docker build -t zadanie1 . 
docker run -d -P -p 8080:8080 --name zadanie1 zadanie1