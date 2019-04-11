#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $host ]; then
  host=$(awk -F "=" '/host/ {print $2}' $ENV_FILE)
fi

echo $host
