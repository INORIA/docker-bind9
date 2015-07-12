#!/bin/sh

mkdir sshkeys
ssh-keygen -b 2048 -t rsa -f ./sshkeys/key -q -N ""

# build docker
docker build -t inoria/bind9 .
