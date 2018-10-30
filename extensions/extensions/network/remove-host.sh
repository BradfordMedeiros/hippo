#!/usr/bin/env bash

hostname=$1
HIPPO_ID=$(<hippo-id)

ip_address=$(echo $1)
hostname=$(echo $2 | awk '{ print $1 }')

NEW_HOST_FILE=$(cat /etc/hosts | grep -v  "$hostname #$HIPPO_ID") 
echo "$NEW_HOST_FILE" > /etc/hosts
