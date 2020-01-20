#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $remote ]; then
  remote=$(awk -F "=" '/^remote/ {print $2}' $ENV_FILE)
fi

echo $remote
