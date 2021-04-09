#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

DEFAULT_ENV_FILE="${DIR}/../.env.dokku"

if [ -z $ENV_FILE ]; then
  if [ -e "$DEFAULT_ENV_FILE" ]; then
    ENV_FILE=$DEFAULT_ENV_FILE
  else
    ENV_FILE="${DIR}/../.env.sample"
  fi
fi

echo $ENV_FILE
