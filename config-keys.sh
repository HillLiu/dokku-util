#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $configkeys ]; then
  configkeys=$(awk -F "=" '/^configkeys/ {print $2}' $ENV_FILE)
fi

echo $configkeys
