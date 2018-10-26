cat ../../pkg/data/remote/manifest.json  | jq -j '.tiles[] | .name," ", .path, "\n"'
