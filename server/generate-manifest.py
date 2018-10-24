
import argparse
import sys

def handle_parse_error(x):
	raise Exception(x)

def parse_args(options):
	parser = argparse.ArgumentParser(description='Generate manifest from a folder structure for hippo package manager.')
	parser.error = handle_parse_error # this normally calls exit
	parser.add_argument('-d', '--data', dest='data', required=True, help='root nginx static directory')
	options = parser.parse_args(options)
	return vars(options)

def generate_manifest(folder_path):
	# get list of the folders
	# for each folder add the tars to the thing
	manifests = { }
	return manifests



options = parse_args(sys.argv[1:])
print options['data']