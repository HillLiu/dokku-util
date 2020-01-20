#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $scales ]; then
  scales=$(awk -F "=" '/^scales/ {print $2}' $ENV_FILE)
fi

echo $scales
