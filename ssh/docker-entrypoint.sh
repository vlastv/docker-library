#!/bin/sh

ssh-keygen -A

adduser -u $UID -D $USER

echo "$USER:${PASSWORD}" | chpasswd  

exec "$@"