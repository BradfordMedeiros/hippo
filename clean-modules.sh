#!/usr/bin/env bash

# REMOVE ALL EXTENSIONS FROM CLIENT

rm -r client/extensions/* 2>/dev/null


# REMOVE THINGS FROM SERVER
rm -r server/data-sample/extensions/* 2>/dev/null
rm -r server/data-sample/modules/*  2>/dev/null
rm -r server/data-sample/styles/* 2>/dev/null
rm -r server/data-sample/tiles/* 2>/dev/null

rmdir server/data-sample/extensions
rmdir server/data-sample/modules
rmdir server/data-sample/styles
rmdir server/data-sample/tiles
