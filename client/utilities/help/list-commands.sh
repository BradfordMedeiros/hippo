#!/usr/bin/env bash

module_to_describe="$1"

cat "../$module_to_describe/command-surface.json"  \
	| jq -r -j 'to_entries[] | .key," -> ", .value.description, "\n"' \
	| sed 's/null/no description/g'

