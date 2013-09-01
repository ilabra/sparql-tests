#! /bin/bash

# environment :
# DYDRA_ACCOUNT : account name
# DYDRA_URL : host http url 
# DYDRA_REPOSITORY : individual repository

curl -f -s -S -X GET\
     -H "Accept: application/nquads" \
     $DYDRA_URL/${DYDRA_ACCOUNT}/${DYDRA_REPOSITORY}?default \
 | diff -q - GET-nquads-default-response.nq > /dev/null

