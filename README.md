#hippo

Program made to run configure raspberry pi.  Simplicity over robustness.


Usage:

tile-manipulation:
--------------------
~~~~
hippo tiles list-installed
hippo tiles list-remote
hippo tiles install <tilename>
hippo tiles remove <tilename>
hippo tiles purge
~~~~

module-manipulation:
--------------------
~~~~
hippo module list-installed
hippo module list-remote
hippo module install <module>
hippo module uninstall <module>
hippo modules purge
~~~~

service-helpers
~~~~
hippo service install path-to-shell-script.sh          # private list maintained by hippo 
hippo service uninstall path-to-shell-script.sh
~~~~

networking
~~~~
hippo network add-host <somehost> <some_ipaddress>  # private list maintainted by hippo 
hippo network remove-host <somehost> 
~~~~


misc
~~~~
hippo lights set red     # fun manipulation of hw?
hippo lights get
~~~~

maybe even:
~~~~
hippo extensions list 
hippo extensions install <extension name>
hippo extensions uninstall <extension name>


which could do something like:
hippo simple-hippo init
~~~~ 
