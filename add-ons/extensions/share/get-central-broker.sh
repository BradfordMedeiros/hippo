#!/usr/bin/env bash

set -e 

BROKER=$(cat ./broker 2> /dev/null)

if [[ -z "$BROKER" ]]; then
	BROKER=$(./bootstrapper get brokers/default-broker) 
	echo "$BROKER" > broker
fi

echo "$BROKER"
