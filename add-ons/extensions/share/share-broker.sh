#!/usr/bin/env bash

# this should depend on bootstrapper to get the latest of my central broker 
# once it has that, it should publish

if [[ -z "$1" ]]; then
	1>&2 echo "ip address unset"
	exit 1
fi 

ID=$(./generate-id.sh)
TOPIC_ID="brokers/$ID"
IP_ADDRESS="$1"

./bootstrapper set "$TOPIC_ID" "$IP_ADDRESS"
