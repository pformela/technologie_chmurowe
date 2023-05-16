#!/bin/bash

response=$(curl -s http://localhost:8080)

res_regex=".*((([01][0-9])|(2[0-3])):([0-5][0-9]):([0-5][0-9])).*"

if [[ $response =~ $res_regex ]]; then
    echo "Test passed"
else
    echo "Test failed"
fi

echo $response
echo $res_regex
