#!/bin/sh

DATA_NAME=bind9-data

# Create bind9-data container
docker run -d -v /etc/bind --name $DATA_NAME inoria/bind9

