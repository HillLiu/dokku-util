#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"

host=`${DIR}/host.sh`
port=`${DIR}/port.sh`
app=`${DIR}/dokku-app.sh`

run(){
    ssh -p $port -t $host "$1"
}

cmd="sudo dokku config:set --no-restart $app"
cmd+=";" # config:set

# Last
cmd+="sudo dokku ps:stop $app;"
cmd+="sudo dokku ps:start $app;"

run "$cmd"
