#!/usr/bin/env bash

function install_extension(){	
   extension_name=$1
   (cd "extensions/extensions/$extension_name" && tar -cvf "$extension_name" *)
   mv "extensions/extensions/$extension_name/$extension_name" server/data-sample/extensions
}

#INSTALL MODULES TO CLIENT
mkdir -p client/extensions
cp -r extensions/extensions/extensions client/extensions/extensions
cp -r extensions/extensions/pkg client/extensions/pkg

#INSTALL MODULES TO SERVER
mkdir -p server/data-sample/extensions
mkdir -p server/data-sample/modules
mkdir -p server/data-sample/styles
mkdir -p server/data-sample/tiles

install_extension extensions
install_extension help
install_extension tiles
install_extension pkg
install_extension network
install_extension modules
install_extension services
