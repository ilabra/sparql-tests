#! /bin/bash

# environment :
# STORE_ACCOUNT : account name
# STORE_URL : host http url 
# STORE_REPOSITORY : individual repository

curl -w "%{http_code}\n"  -f -s -S -X GET \
     -H "Accept: application/n-quads" \
     ${STORE_URL}/${STORE_ACCOUNT}/${STORE_REPOSITORY} \
 | fgrep -q "401"


