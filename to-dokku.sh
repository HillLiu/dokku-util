#!/bin/bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
remote=`${DIR}/dokku-remote.sh`
local=`git branch | grep \* | cut -d ' ' -f2`

git add -A; git commit --amend --no-edit; git push ${remote} ${local}:master -f
