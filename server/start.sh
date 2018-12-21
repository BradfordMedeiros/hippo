#!/usr/bin/env bash

function get_ip(){
	echo $(ifconfig | grep "inet " | head -n 2 |  tail -n 1 | awk '{ print $2 }')
}

CONTENT_FOLDER="$(pwd)/data-sample";

if [[ ! -z "$1" ]]; then 
  MANIFEST_HOSTNAME="$1"
else 
  MANIFEST_HOSTNAME="http://$(get_ip):8000" 
fi

if [[ ! -z "$2" ]]; then
  PORT="$2"
else 
  PORT="8000"
fi

TEMPLATE_FILE=$(pwd)/nginx.conf.template
GENERATED_FILE=$(pwd)/nginx.conf
MANIFEST_FILE=$(pwd)/data-sample/manifest.json

python generate-manifest.py -d ./data-sample/ -b "$MANIFEST_HOSTNAME" > "$MANIFEST_FILE"

sed -e "s|{{PORT}}|$PORT|g" -e "s|{{CONTENT_FOLDER}}|$CONTENT_FOLDER|g" "$TEMPLATE_FILE" > "$GENERATED_FILE"

nginx -c "$GENERATED_FILE"

rm "$GENERATED_FILE"
rm "$MANIFEST_FILE"
