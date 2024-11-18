#!/bin/bash

# https://dokku.com/docs/networking/proxies/nginx/#specifying-a-custom-client_max_body_size

DIR="$(
  cd "$(dirname "$0")"
  pwd -P
)"
ENV_FILE=$(${DIR}/env-file.sh)

if [ -z $nginxClientMaxBodySize ]; then
  nginxClientMaxBodySize=$(awk -F "=" '/^nginxClientMaxBodySize/ {print $2}' $ENV_FILE)
fi

echo $nginxClientMaxBodySize
