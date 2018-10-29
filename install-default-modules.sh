#!/usr/bin/env bash

#INSTALL MODULES TO CLIENT
cp -r extensions/extensions/extensions client/extensions/extensions
cp -r extensions/extensions/pkg client/extensions/pkg

#INSTALL MODULES TO SERVER
mkdir -p server/data-sample/extensions
mkdir -p server/data-sample/modules
mkdir -p server/data-sample/styles
mkdir -p server/data-sample/tiles

