
all: client-bundle server-bundle
	
# Client bundle is the hippo client with extension and pkg extensions preinstalled
client-bundle: 
	mkdir -p ./build/
	cp -r ./client ./build/
	cp -r ./add-ons/extensions/extensions ./build/client/extensions
	cp -r ./add-ons/extensions/pkg ./build/client/extensions

# Server bundle is the server with all the add-ons preinstalled
server-bundle: server-data
	@echo "build server-bundle"
	mkdir -p ./build
	cp -r ./server ./build/server
	cp -r ./build/server-data/* ./build/server/data-sample/

# Server data is the data folder used by the server bundle
server-data: add-ons
	@echo "build server-data"
	mkdir -p ./build/server-data
	mkdir -p ./build/server-data/styles
	mkdir -p ./build/server-data/extensions
	mkdir -p ./build/server-data/modules
	mkdir -p ./build/server-data/tiles
	cp -r add-ons/styles ./build/server-data/
	cp -r add-ons/extensions ./build/server-data/
	cp -r add-ons/modules ./build/server-data/
	cp -r add-ons/tiles ./build/server-data/

clean:
	rm -rf ./build