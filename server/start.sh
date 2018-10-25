#!/usr/bin/env bash

PORT=8000
CONTENT_FOLDER="\/home\/brad\/automate\/hippo\/server\/data-sample";
MANIFEST_HOSTNAME="http://localhost:$PORT"

TEMPLATE_FILE=$(pwd)/nginx.conf.template
GENERATED_FILE=$(pwd)/nginx.conf
MANIFEST_FILE=$(pwd)/data-sample/manifest.json

python generate-manifest.py -d ./data-sample/ -b "$MANIFEST_HOSTNAME" > "$MANIFEST_FILE"

sed -e "s/{{PORT}}/$PORT/g" -e "s/{{CONTENT_FOLDER}}/$CONTENT_FOLDER/g" "$TEMPLATE_FILE" > "$GENERATED_FILE"

nginx -c "$GENERATED_FILE"

rm "$GENERATED_FILE"
rm "$MANIFEST_FILE"
