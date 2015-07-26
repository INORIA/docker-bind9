#!/bin/sh

cd $(git rev-parse --show-toplevel)

NAME=bind9
DATA_NAME=bind9-data

# Create bind9 data volume container
cd Dockerfiles/bind9-data
cp ../../data/* ./data/
docker build -t inoria/bind9-data .
docker run -d --name $DATA_NAME inoria/bind9-data /bin/bash
# clean up
git checkout data
git clean -df data

# Create bind9 server container
docker run -d --volumes-from bind9-data --name $NAME inoria/bind9 /sbin/my_init


