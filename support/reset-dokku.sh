#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

host=`${DIR}/host.sh`
port=`${DIR}/port.sh`
app=`${DIR}/dokku-app.sh`
remote=`${DIR}/dokku-remote.sh`
dokkuServer=${host}:${port}
ssh="ssh://dokku@${dokkuServer}/$app"

echo '###'
echo "# Set ssh: $ssh"
echo "# App: $app"
echo "##"

git remote remove $remote 
git remote add $remote $ssh 
git remote -v
echo ""
