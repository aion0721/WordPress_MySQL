#!/bin/bash

if [ $# -ne 1 ]; then
	echo Please input one argument.
	exit 1
fi

target_name=$1

echo ${target_name}

ssh-copy-id pi@${target_name}

scp /root/.ssh/id_rsa.pub pi@${target_name}:/tmp

ssh pi@${target_name} "sudo mkdir -m 700 /root/.ssh"

ssh pi@${target_name} "sudo ssh-keygen -t rsa -m PEM -N '' -f /root/.ssh/id_rsa"

ssh pi@${target_name} "sudo cp /tmp/id_rsa.pub /root/.ssh/authorized_keys"

rm ~/pi@${target_name}
