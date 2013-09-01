#! /bin/bash

# environment :
# DYDRA_ACCOUNT : account name
# DYDRA_URL : host http url
# DYDRA_TOKEN : authentication token

# if local, then the private plus private-ip results apply
if $DYDRA_IS_LOCAL
then
  exit 0;
fi

curl -f -s -S -X GET\
     -H "Accept: application/sparql-results+json" \
     $DYDRA_URL/${DYDRA_ACCOUNT}/repositories?auth_token=${DYDRA_TOKEN} \
 | json_reformat -m | diff -q - GET-response.json > /dev/null

