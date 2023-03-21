#!/usr/bin/env sh

DIR="$(
  cd "$(dirname "$0")"
  pwd -P
)"
ENV_FILE=$(${DIR}/env-file.sh)

if [ -z $domains ]; then
  domains=$(awk -F "=" '/^domains\[\]/ {print $2}' $ENV_FILE)
fi

echo $domains
