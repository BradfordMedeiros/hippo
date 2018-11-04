import sys
import json
import os

def get_manifest(extension_name):
	manifest_path =  os.path.join('..', extension_name, 'command-surface.json')
	file = open(manifest_path, 'r') 
	file_content =  file.read() 
	file.close()
	return json.loads(file_content)

def get_supplies(extension_name):
	manifest = get_manifest(extension_name)
	if manifest.has_key('supplies'):
		return manifest['supplies']
	else:
		return []

def get_depends(extension_name):
	manifest = get_manifest(extension_name)
	if manifest.has_key('depends'):
		return manifest['depends']
	else:
		return []

def get_installed_extension_names():
	output = [file for file in os.listdir('..') if os.path.isdir(os.path.join('..', file))]
	return output

def depends_in_supplies(supplies, extensions_depends):
	flattened_list = []
	for depends in extensions_depends:
		for dep in depends:
			flattened_list.append(dep)

	for supply in supplies:
		if supply in flattened_list:
			return True

	return False

if len(sys.argv) < 2:
	print 'must supply extension name'
	exit(1)

extension_name=sys.argv[1]
supplies  = get_supplies(extension_name)
extensions = get_installed_extension_names()
depends = map(lambda extension: get_depends(extension), extensions)

in_supplies = depends_in_supplies(supplies, depends)
if in_supplies:
	print 'true'
	exit(1)
else:
	print 'false'
	exit(0)
