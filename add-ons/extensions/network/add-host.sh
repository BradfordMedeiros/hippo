#!/usr/bin/env bash

HIPPO_ID=$(<hippo-id)
echo "id is: $HIPPO_ID"

ip_address=$(echo $1)
hostname=$(echo $2 | awk '{ print $1 }')

echo "$ip_address  ($hostname #$HIPPO_ID)" >> /etc/hosts
