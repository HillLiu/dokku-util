#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

host=`${DIR}/host.sh`
port=`${DIR}/port.sh`
app=`${DIR}/dokku-app.sh`
remote=`${DIR}/dokku-remote.sh`
dokkuServer=${host}:${port}
ssh="ssh://dokku@${dokkuServer}/$app"

echo $ssh; 

git remote remove $remote 
git remote add $remote $ssh 

