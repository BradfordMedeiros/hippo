#!/usr/bin/env bash

function get_ip(){
	echo $(ifconfig | grep "inet " | head -n 2 |  tail -n 1 | awk '{ print $2 }')
}

PORT=8000
CONTENT_FOLDER="$(pwd)/data-sample";
MANIFEST_HOSTNAME="http://$(get_ip):$PORT"

TEMPLATE_FILE=$(pwd)/nginx.conf.template
GENERATED_FILE=$(pwd)/nginx.conf
MANIFEST_FILE=$(pwd)/data-sample/manifest.json

python generate-manifest.py -d ./data-sample/ -b "$MANIFEST_HOSTNAME" > "$MANIFEST_FILE"

sed -e "s|{{PORT}}|$PORT|g" -e "s|{{CONTENT_FOLDER}}|$CONTENT_FOLDER|g" "$TEMPLATE_FILE" > "$GENERATED_FILE"

nginx -c "$GENERATED_FILE"

rm "$GENERATED_FILE"
rm "$MANIFEST_FILE"
