
all: client-bundle server-bundle docker-image

# Client bundle is the hippo client with extension and pkg extensions preinstalled
client-bundle: 
	git submodule init
	git submodule update
	mkdir -p ./build/
	cp -r ./client ./build/
	cp -r ./add-ons/extensions/extensions ./build/client/extensions
	cp -r ./add-ons/extensions/pkg ./build/client/extensions
	(cd ./build/client && tar -cvf client.tar *)

publish-docker: docker-image
	docker push bradfordmedeiros/hippo:0.56

docker-image: server-bundle
	@echo "build docker image"
	docker build -t bradfordmedeiros/hippo:0.56 .

# Server bundle is the server with all the add-ons preinstalled
server-bundle: server-data
	@echo "build server-bundle"
	mkdir -p ./build
	cp -r ./server ./build/server
	cp -r ./build/server-data/* ./build/server/data-sample/

# Server data is the data folder used by the server bundle
server-data: packaged-addons client-bundle
	@echo "build server-data"
	mkdir -p ./build/server-data
	mkdir -p ./build/server-data/styles
	mkdir -p ./build/server-data/extensions
	mkdir -p ./build/server-data/tiles
	mkdir -p ./build/server-data/blobs
	cp -r ./build/packaged-addons/build/styles ./build/server-data/
	cp -r ./build/packaged-addons/build/extensions ./build/server-data/
	cp -r ./build/packaged-addons/build/tiles ./build/server-data
	cp ./build/client/client.tar ./build/server-data/blobs

packaged-addons:
	@echo "build packaged-addons"
	mkdir -p ./build/packaged-addons
	cp -r ./add-ons/* ./build/packaged-addons
	(cd ./build/packaged-addons && ./package-all.sh)

clean:
	rm -rf ./build
