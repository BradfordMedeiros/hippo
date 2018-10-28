import sys
import json
import os
from subprocess import call

def read_extension_manifest(extension_name):
	file = open(os.path.join('./utilities', extension_name,'command-surface.json'), 'r') 
	file_content =  file.read() 
	file.close()
	return json.loads(file_content)

def get_extension_directory(extension):
	return os.path.join('./utilities', extension)

def execute_script(extension, script_path):
	call([os.path.join('.',script_path)], cwd=get_extension_directory(extension))

args = sys.argv
surface = args[1]
surface_args = args[2:]

manifest = read_extension_manifest(surface)
command_params = surface_args[0]
command = manifest[command_params]
script_path = command['script']
execute_script(surface, script_path)

