#!/usr/bin/env sh

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

if [ -z $mounts ]; then
  mounts=$(awk -F "=" '/^mounts\[\]/ {print $2}' $ENV_FILE)
fi

echo $mounts
