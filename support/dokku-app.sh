#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $app ]; then
  app=$(awk -F "=" '/^app/ {print $2}' $ENV_FILE)
fi

echo $app
