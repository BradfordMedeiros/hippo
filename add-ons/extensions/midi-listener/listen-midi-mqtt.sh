#!/usr/bin/env bash

# Mqtt topics look like this


# { 
#   "source": <string>, 
#   "event": <string>, 
#   "ch": <string>, 
#   "data": <string> 
#}
# @todo add the parsing logic to rip the above fields 

aseqdump -p MPKmini2 | awk '
/64/ {
   print ("turn on")
   system("mqtt --publish -t states/midi -m on")
}

/60/{
   print ("turn off")
   system("mqtt --publish -t states/midi -m off")
}
'
