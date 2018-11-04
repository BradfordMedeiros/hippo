#!/usr/bin/env bash

cat /etc/hosts | grep "$(<hippo-id)" | awk '{ printf $1; printf " "; print $2; }'
