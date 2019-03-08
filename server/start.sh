#!/usr/bin/env bash

function get_ip(){
	echo $(ifconfig | grep "inet " | head -n 2 |  tail -n 1 | awk '{ print $2 }')
}

CONTENT_FOLDER="$(pwd)/data-sample/";

if [[ ! -z "$1" ]]; then 
  MANIFEST_HOSTNAME="$1"
else 
  MANIFEST_HOSTNAME="http://$(get_ip):80" 
fi

if [[ ! -z "$2" ]]; then
   BASE_ROUTE="$2"
else
   BASE_ROUTE="/"
fi

if [[ ! -z "$3" ]]; then
   PORT="$3"
else
   PORT=8000
fi

TEMPLATE_FILE=$(pwd)/nginx.conf.template
GENERATED_FILE=$(pwd)/nginx.conf
MANIFEST_FILE=$(pwd)/data-sample/manifest.json

python generate-manifest.py -d ./data-sample/ -b "$MANIFEST_HOSTNAME" > "$MANIFEST_FILE"

sed \
-e "s|{{BASE_ROUTE}}|$BASE_ROUTE|g" \
-e "s|{{PORT}}|$PORT|g" \
-e "s|{{CONTENT_FOLDER}}|$CONTENT_FOLDER|g" \
"$TEMPLATE_FILE" > "$GENERATED_FILE"

nginx -c "$GENERATED_FILE"

rm "$GENERATED_FILE"
rm "$MANIFEST_FILE"
