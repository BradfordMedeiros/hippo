

# Mqtt topics look like this


# { 
#   "source": <string>, 
#   "event": <string>, 
#   "ch": <string>, 
#   "data": <string> 
#}

# All this tries to do is extract the four columns and publish and mqtt topic.  The escaping/parsing is a bit overly tricky. 
aseqdump -p MPKmini2 | awk -v sq="'" '

// {
   split($0, comma_array, ",")
    
   data = ""
   for (i =2 ; i <= length(comma_array); i++){      
       data = data " " comma_array[i]
       if (i != length(comma_array)){
          data = data ","
       }
   }

   split(comma_array[1], space_array, " ")
   
   source = space_array[1]
   event = space_array[2]
   for (i = 3; i < length(space_array); i++){
      event = event " " space_array[i]
   }
  
   channel = space_array[length(space_array)]  

   json = "{"  "\"" "source" "\":" "\"" source "\","  "\"" "event" "\":" "\""  event "\"," "\"" "channel" "\":" "\""  channel "\","  "\"" "data" "\":" "\""  data "\"" "}"
   message = "mqtt --publish -t states/midi -m " sq json sq
   system(message)
}'
