#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
ENV_FILE=`${DIR}/env-file.sh`

host=`${DIR}/host.sh`
port=`${DIR}/port.sh`
app=`${DIR}/dokku-app.sh`
scales=`${DIR}/scales.sh`
mounts=`${DIR}/mounts.sh`
configkeys=`${DIR}/config-keys.sh`

if [ ! -z "$scales" ]; then
  scaleCmd="sudo dokku ps:scale $app"
  for ss in ${scales} ; do
    scaleValue=$(awk -F "=" '/^'"${ss}"'/ {print $2}' $ENV_FILE)
    scaleCmd+=" ${ss}=$scaleValue"
  done
  scaleCmd+=";"
else
  scaleCmd=""
fi

if [ ! -z "$mounts" ]; then
  mountCmd=""
  for mm in ${mounts} ; do
    mountCmd+="dokku storage:mount ${app} ${mm};"
  done
else
  mountCmd=""
fi

if [ ! -z "$configkeys" ]; then
  configCmd="sudo dokku config:set --no-restart $app"
  for cc in ${configkeys} ; do
    configValue=$(awk -F "=" '/^'"${cc}"'/ {print $2}' $ENV_FILE)
    configCmd+=" ${cc}=$configValue"
  done
  configCmd+=";"
else
  configCmd=""
fi

run(){
    ssh -p $port -t $host "$1"
}

cmd=${configCmd}${scaleCmd}${mountCmd}
# Last
if [ -z "$scales" ] && [ -z "${mountCmd}" ]; then
  cmd+="sudo dokku ps:stop $app;"
  cmd+="sudo dokku ps:start $app;"
fi

echo "###"
echo "# Running following command"
echo "###"
echo ""
echo $cmd;
echo ""

run "$cmd"
