#!/usr/bin/env bash

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
remote=`${DIR}/dokku-remote.sh`
local=`git branch | grep \* | cut -d ' ' -f2`

export GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no"

git add -A && \
  git commit --amend --no-edit && \
  git push ${remote} ${local}:master -f && \
  git reset origin/${local}

exit 0
