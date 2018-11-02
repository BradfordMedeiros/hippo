import sys
import json
import os

def read_file(filename):
	file = open(filename, 'r') 
	file_content =  file.read() 
	file.close()
	return file_content

def read_deps_as_array(filename):
	file_content = read_file(filename)
	deps_array = map(lambda str: str.strip(), file_content.split('\n'))
	lines = filter(lambda dep: len(dep) > 0, deps_array)
	return lines

def read_deps_from_manifest(filename):
	file_content = json.loads(read_file(filename))
	if file_content.has_key('supplies'):
		return file_content['supplies']
	else:
		return []

def write_file(deps, file_destination):
	file = open(file_destination,'w') 
	for i in range(len(deps)):
		file.write(deps[i])
		if i != len(deps) - 1:
			file.write('\n')
	file.close() 

def remove_manifest_deps_from_deps(deps, manifest_deps):
	new_deps = {}
	for dep in deps:
		new_deps[dep] = True
	
	for dep in manifest_deps:
		new_deps.pop(dep, None)

	return new_deps.keys()

DEPS_FILE = '../../local_data/deps'
if len(sys.argv) < 2:
     raise Exception('no tilename added')

tilename = sys.argv[1]
command_surface = os.path.join('..', tilename, 'command-surface.json')
deps = read_deps_as_array(DEPS_FILE)
remove = read_deps_from_manifest(command_surface)
new_deps = remove_manifest_deps_from_deps(deps, remove)
write_file(new_deps, DEPS_FILE)