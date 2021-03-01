#!/bin/bash

USER=admin
PASS=admin
HOST=localhost
PORT=4502

curl -s \
    -u ${USER}:${PASS} \
    "http://${HOST}:${PORT}/bin/querybuilder.json" | jq .
