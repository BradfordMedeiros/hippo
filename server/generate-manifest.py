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
	options = parser.parse_args(options)
	return vars(options)

def create_module_from_filename(filename, baseroute):
	return { 'name': filename, 'path': os.path.join(baseroute,filename) }

def generate_submanifest(directory, baseroute):
	files = [x for x in os.walk(directory) if os.path.isfile][0][2]
	return [create_module_from_filename(file, baseroute) for file in files]

def generate_manifest(folder_path, baseroute):
	tile_folder = os.path.join(folder_path, 'tiles')
	module_folder = os.path.join(folder_path, 'modules')

	manifests = { }
	tile_data = generate_submanifest(tile_folder, baseroute)
	module_data = generate_submanifest(module_folder, baseroute)

	manifests['tiles'] = tile_data
	manifests['modules'] = module_data

	return manifests


options = parse_args(sys.argv[1:])
manifest = generate_manifest(options['data'], 'http://blacksmith.io/hippo/')
print json.dumps(manifest)