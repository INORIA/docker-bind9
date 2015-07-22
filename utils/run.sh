#!/bin/sh

cd $(git rev-parse --show-toplevel)

DATA_NAME=bind9-data

# Create bind9-data container
cd Dockerfiles/bind9-data
cp ../../data/* ./data/
docker build -t inoria/bind9-data .
# docker run -d -v /etc/bind --name $DATA_NAME inoria/bind9


