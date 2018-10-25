#!/usr/bin/env bash

PORT=8000

TEMPLATE_FILE=$(pwd)/nginx.conf.template
GENERATED_FILE=$(pwd)/nginx.conf


sed "s/{{PORT}}/$PORT/g" "$TEMPLATE_FILE" > "$GENERATED_FILE"

nginx -c "$GENERATED_FILE"

rm "$GENERATED_FILE"
