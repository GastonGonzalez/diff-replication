#!/bin/bash

USER=admin
PASS=admin
HOST=localhost
PORT=4502

PRED1_KEY="1_property=jcr:primaryType"
PRED1_VAL="1_property.value=dam:Asset"
PRED1_OP="1_property.operation=like"
PRED1_PARAMS="${PRED1_KEY}&${PRED1_VAL}&${PRED1_OP}"

PRED2_KEY="2_property=contentFragment"
PRED2_VAL="2_property.value=true"
PRED2_PARAMS="${PRED2_KEY}&${PRED2_VAL}"

#QUERY="path=/content/dam&${PRED1_PARAMS}&${PRED2_PARAMS}"
QUERY="path=/content/dam&${PRED2_PARAMS}"

curl -s \
    -u ${USER}:${PASS} \
    "http://${HOST}:${PORT}/bin/querybuilder.json?${QUERY}" | jq .

echo "Query: ${QUERY}"
