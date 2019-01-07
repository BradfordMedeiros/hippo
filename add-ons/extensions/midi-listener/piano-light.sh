#!/usr/bin/env bash

aseqdump -p MPKmini2 | awk '
/64/ {
   print ("turn on")
   system("wemo switch light on")
}

/60/{
   print ("turn off")
   system("wemo switch light off")
}
'
