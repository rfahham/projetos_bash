#!/bin/bash

IP="$( /sbin/ifconfig -a | grep broadcast | sed 's/netmask.*//g; s/[^0-9.]//g')"

echo O seu IP é ${IP}