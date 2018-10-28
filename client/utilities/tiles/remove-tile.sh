#!/usr/bin/env bash

tilename="$1"

# GET THE DIRECTORY TO REMOVE BY SEARCHING LOCALLY INSTALLED TILES (JUST FOR CORRECTNESS -- will be nice to add in error messages, etc if this fails)
tile_to_remove=$(./list-local-tiles.sh | grep -w "$tilename")
tile_directory="../../../local-data/tiles/$tile_to_remove"

rm -r "$tile_directory"
