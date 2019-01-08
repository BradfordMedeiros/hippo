#!/usr/bin/env bash

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
