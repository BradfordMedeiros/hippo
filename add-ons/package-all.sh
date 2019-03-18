#!/usr/bin/env bash

function install_extension(){	
   extension_name=$1
   (cd "extensions/$extension_name" && tar -cvf "$extension_name" *)
   mv "extensions/$extension_name/$extension_name" ./build/extensions
}

mkdir -p ./build
mkdir -p ./build/extensions
mkdir -p ./build/styles
mkdir -p ./build/tiles

install_extension extensions
install_extension help
install_extension tiles
install_extension pkg
install_extension network
install_extension services
install_extension usb-exec
install_extension automate_docker_0.7
install_extension espeak
install_extension midi-listener
install_extension mqtt-broker
install_extension nfs
install_extension share

# External github repos.  These need to be built.  
# probably shouldn't be doing doing in source builds but whatever
(cd external-repos/bootstrapper && make bootstrapper) 
cp -r ./external-repos/bootstrapper/build/* ./extensions/bootstrapper
install_extension bootstrapper

cp -r ./styles/* ./build/styles
cp -r ./tiles/* ./build/tiles
