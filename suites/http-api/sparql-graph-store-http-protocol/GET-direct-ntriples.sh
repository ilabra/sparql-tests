#! /bin/bash

curl -f -s -S -X GET\
     -H "Accept: application/n-triples" \
     ${STORE_URL}/${STORE_ACCOUNT}/${STORE_REPOSITORY}?auth_token=${STORE_TOKEN} \
 | diff -q - GET-response.nt > /dev/null

