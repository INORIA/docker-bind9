#!/bin/sh

cd $(git rev-parse --show-toplevel)

NAME=bind9
DATA_NAME=bind9-data


# if required images exists just exec run
if docker images | grep -q 'inoria/bind9'; then
	if docker images | grep -q 'inoria/bind9-data'; then
		# remove existent 'bind9' bind9-data' container
		docker ps -a | grep 'bind9' | awk '{print $1}' | xargs --no-run-if-empty -I % bash -c 'docker stop %; docker rm %'

		docker run -it -d --name $DATA_NAME inoria/bind9-data /bin/bash
		docker run -d -p 53:53 -p 53:53/udp --volumes-from bind9-data --name $NAME inoria/bind9 /sbin/my_init
		exit 1
	fi
fi


# Create bind9 data volume container
cd Dockerfiles/bind9-data
rm -r ./data/*
cp -r ../../data/* ./data/
docker build -t inoria/bind9-data .
docker run -it -d --name $DATA_NAME inoria/bind9-data /bin/bash
# clean up
# git checkout data
# git clean -df data

# Create bind9 server container
docker run -d -p 53:53 -p 53:53/udp --volumes-from bind9-data --name $NAME inoria/bind9 /sbin/my_init


