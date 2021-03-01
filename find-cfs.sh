#!/bin/bash
# Author      : Gaston Gonzalez
# Date        : 1 March 2021
# Description : Shell script to query content fragments

# Change values accordingly
USER=admin
PASS=admin
HOST=localhost
PORT=4502

# Do not change anything below this line

PATH_PARAM="path=/content/dam"
TYPE_PARAM="type=dam:Asset"

PRED1_KEY="1_property=@jcr:content/contentFragment"
PRED1_VAL="1_property.value=true"
PRED1_PARAMS="${PRED1_KEY}&${PRED1_VAL}"

# Return all results and guess total for performance
LIMIT="p.limit=-1&p.guessTotal=true"

QUERY="${PATH_PARAM}&${TYPE_PARAM}&${PRED1_PARAMS}&${LIMIT}"

curl -s \
    -u ${USER}:${PASS} \
    "http://${HOST}:${PORT}/bin/querybuilder.json?${QUERY}" | jq .

echo "Query: ${QUERY}"
