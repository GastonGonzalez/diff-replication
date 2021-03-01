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
#TYPE_PARAM="type=dam:Asset"

PRED1_KEY="1_property=contentFragment"
PRED1_VAL="1_property.value=true"
PRED1_PARAMS="${PRED1_KEY}&${PRED1_VAL}"

PRED2_KEY="2_property=jcr:primaryType"
PRED2_VAL="2_property.value=dam:AssetContent"
PRED2_PARAMS="${PRED2_KEY}&${PRED2_VAL}"

LIMIT="p.limit=100&p.guessTotal=true"

# control how much data to return
NODE_DATA="p.hits=full&p.nodedepth=1"

QUERY="${PATH_PARAM}&${PRED2_PARAMS}&${PRED1_PARAMS}&${NODE_DATA}&${LIMIT}"
REQUEST="http://${HOST}:${PORT}/bin/querybuilder.json?${QUERY}"

# TODO: implement pagination calls
curl -s \
    -u ${USER}:${PASS} \
    ${REQUEST} | jq .

echo "Request: ${REQUEST}"
echo "Query: ${QUERY}"
