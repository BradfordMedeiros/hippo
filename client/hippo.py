import sys
import json
import os
from subprocess import call

extension_folder = "./extensions"

def read_extension_manifest(extension_name):
	file = open(os.path.join(extension_folder, extension_name,'command-surface.json'), 'r') 
	file_content =  file.read() 
	file.close()
	return json.loads(file_content)

def get_extension_directory(extension):
	return os.path.join(extension_folder, extension)

def execute_script(extension, script_path, args):
	call([os.path.join('.',script_path)] + args, cwd=get_extension_directory(extension))

args = sys.argv
surface = args[1]
surface_command = args[2]
surface_args = args[3:]

manifest = read_extension_manifest(surface)
command = manifest["commands"][surface_command]

script_path = command['script']
execute_script(surface, script_path, surface_args)