#!/bin/bash


if docker exec -it backend curl -sSf http://database:27017 > /dev/null; then
  echo "Connection backend to database works."
else
  echo "Error connecting backend to database."
  exit 1
fi

if docker exec -it database curl -sSf http://backend:8080 > /dev/null; then
  echo "Connection database to backend works."
else
  echo "Error connecting database to backend."
  exit 1
fi

if docker exec -it backend curl -sSf http://frontend:3000 > /dev/null; then
  echo "Connection backend to frontend works."
else
  echo "Error connecting backend to frontend."
  exit 1
fi

if docker exec -it frontend curl -sSf http://backend:8080 > /dev/null; then
  echo "Connection frontend to backend works."
else
  echo "Error connecting frontend to backend."
  exit 1
fi

echo "All tests passed."
exit 0