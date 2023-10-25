#!/bin/bash

if [ ! -f /lib/systemd/system/mongodb.service ]; then
        apt update
	apt install -y mongodb
	systemctl enable mongodb
	systemctl start mongobd
fi
