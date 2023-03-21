#!/usr/bin/env sh

DIR="$(
  cd "$(dirname "$0")"
  pwd -P
)"

host=$(${DIR}/host.sh)
port=$(${DIR}/port.sh)
app=$(${DIR}/dokku-app.sh)
remote=$(${DIR}/dokku-remote.sh)
dokkuServer=${host}:${port}
ssh="ssh://dokku@${dokkuServer}/$app"

echo '###'
echo "# Set ssh: $ssh"
echo "# App: $app"
echo "##"

if git remote -v | grep -q "${remote}"; then
  git remote remove $remote
fi
git remote add $remote $ssh
git remote -v
echo ""

exit 0
