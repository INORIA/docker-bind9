#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Need container id as a first argument."
	exit 1
fi

ssh -i ./sshkeys/key root@$(docker inspect -f "{{ .NetworkSettings.IPAddress }}" $1)
