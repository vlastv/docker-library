#!/bin/sh

set -eo pipefail

mkdir ~/.ssh 
echo "$SSH_KEY" > ~/.ssh/id_rsa 
chmod 0600 ~/.ssh/id_rsa

echo -e "Host *\n\tStrictHostKeyChecking no\nBatchMode yes\n\n" > ~/.ssh/config

eval "$(ssh-agent -s)"
ssh-add

exec "$@"
