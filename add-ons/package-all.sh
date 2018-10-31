#!/usr/bin/env bash

function install_extension(){	
   extension_name=$1
   (cd "extensions/$extension_name" && tar -cvf "$extension_name" *)
   mv "extensions/$extension_name/$extension_name" ./build/extensions
}

mkdir -p ./build
mkdir -p ./build/extensions
mkdir -p ./build/styles
mkdir -p ./build/modules
mkdir -p ./build/tiles

install_extension extensions
install_extension help
install_extension tiles
install_extension pkg
install_extension network
install_extension modules
install_extension services

cp -r ./styles/* ./build/styles
cp -r ./modules/* ./build/modules
cp -r ./tiles/* ./build/tiles