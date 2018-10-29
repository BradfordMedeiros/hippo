#!/usr/bin/env bash

module_to_describe="$1"
function_to_describe="$2"

cat "../$module_to_describe/command-surface.json" | jq --arg func "$function_to_describe" -r '.[$func].description'