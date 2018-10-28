
# hippo extensions list
# hippo extensions install <extension_name>
# hippo extensions uninstall <extension_name>
import sys
import json
import os

def read_extension_manifest(extension_name):
	file = open(os.path.join('./utilities', extension_name,'command-surface.json'), 'r') 
	file_content =  file.read() 
	file.close()
	return json.loads(file_content)

def get_script_path(extension, rel_script_path):
	return os.path.join('./utilities', extension, rel_script_path )

def list_extensions():
	print 'list'

def install_extension():
	print 'install here'

def uninstall_extension():
	print 'uninstall here'

args = sys.argv
surface = args[1]
surface_args = args[2:]

if surface == 'extension':
	print 'extension surface'
	command = surface_args[0]
	if command == 'list':
		list_extensions()
	elif command == 'install':
		install_extension()
	elif command == 'uninstall':
		uninstall_extension()	
	else:
		print 'invalid command'
elif surface == 'tiles':
	manifest = read_extension_manifest('tiles')
	print 'manifest is: ', manifest
	command_params = surface_args[0]
	command = manifest[command_params]
	script_path = command['script']
	full_path = get_script_path(surface, script_path)
	print 'full path: ', full_path
else:
	print 'extension not installed ', surface

