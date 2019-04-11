#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

if [ -z $ENV_FILE ]; then
  if [ -e .env ]; then
    ENV_FILE="${DIR}/../.env"
  else
    ENV_FILE="${DIR}/../.env.sample"
  fi
fi

echo $ENV_FILE
