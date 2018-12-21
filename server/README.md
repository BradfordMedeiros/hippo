
This is the package manager server for automate.
This is a static nginx server that serves up all packages available.

Use cases:
- Install tiles
- Install new extensions into automate system
- Other types of themes/sharing for automate

This might be a mistake. 

It might be better to use a standard package manager.
I'd rather keep it simple, and have no concept of dependencies. 

If this ever falls out of a simple wget and scripts off a json, it's too complicated
But something like this makes sense for automate


sample layout/ manifest:

~~~~
/tiles
    /tile1
    /tile2
/extensions
    /scheduler
    /logic
/themes 
    /theme1.css
    /theme2.css
~~~~

where tiles, extensions are .tar files, themes are css files

generate-manifest.py will go through the folder structure, and create the json object that looks like:

{
   "tiles": [ 
       { name: "somename", route: "http://routetotileserver/tiles/tileroute" },
       { .... similar to above 
   ],
 
   etc 
}


$1 overloads the main url part of the route, for example, first arg to start.sh/docker

./start.sh localhost:4000/someroute
results in this being added to each route in server, in tiles as example:
{ name: "somename", route: "localhost:4000/someroute/tiles/tileroute" }

Note this does not change the routing, it remains the same.  This is for use
in conjunction with load balancers in between.









 
