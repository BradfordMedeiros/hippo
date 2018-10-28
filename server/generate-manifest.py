import argparse
import sys
import os
import json

def handle_parse_error(x):
	raise Exception(x)

def parse_args(options):
	parser = argparse.ArgumentParser(description='Generate manifest from a folder structure for hippo package manager.')
	parser.error = handle_parse_error # this normally calls exit
	parser.add_argument('-d', '--data', dest='data', required=True, help='root nginx static directory')
        parser.add_argument('-b', '--basename', dest='basename', required=True, help='basename to use for the manifest')
        options = parser.parse_args(options)
	return vars(options)

def create_module_from_filename(filename, filetype, baseroute):
	return { 'name': filename, 'path': os.path.join(baseroute, filetype, filename) }

def generate_submanifest(directory, filetype, baseroute):
	files = [x for x in os.walk(directory) if os.path.isfile][0][2]
	return [create_module_from_filename(file, filetype, baseroute) for file in files]

def generate_manifest(folder_path, baseroute):
	extension_folder = os.path.join(folder_path, 'extensions')
	tile_folder = os.path.join(folder_path, 'tiles')
	module_folder = os.path.join(folder_path, 'modules')
	style_folder = os.path.join(folder_path, 'styles')

	manifests = { }
	manifests['extensions'] = generate_submanifest(extension_folder, 'extensions', baseroute)
	manifests['tiles'] = generate_submanifest(tile_folder, 'tiles', baseroute)
	manifests['modules'] = generate_submanifest(module_folder, 'modules',  baseroute)
	manifests['styles'] = generate_submanifest(style_folder, 'styles', baseroute)
	return manifests


options = parse_args(sys.argv[1:])
manifest = generate_manifest(options['data'], options['basename'])
print json.dumps(manifest)
