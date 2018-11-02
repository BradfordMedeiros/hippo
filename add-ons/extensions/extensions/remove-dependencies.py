
def read_file_as_array():
	pass

def read_manifest_as_array():
	read_file_as_array('../')

def read_deps_as_array():
	pass

def substract_deps_from_manifest(manifest_array, deps_array):
	pass

def write_deps():
	pass


extensions_name = "tiles"
manifest = read_manifest_as_array()
deps = read_deps_as_array()
new_deps = substract_deps_from_manifest(manifest, deps)
write_deps(new_deps)