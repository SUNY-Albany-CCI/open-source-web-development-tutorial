Querying Neo4j
==============

.. highlight:: javascript

In this exercise we are going to open a Neo4j database from node.js and
selectively expose its content by using a query in the URL composed on the
client side.

We will put the source code in a file named

      serverReadDatabase04.js

We write the following in the server file:

::


  var http = require('http');

  var neo4j = require('neo4j');

  var neo4jurl = process.env.NEO4J_URL || 'http://localhost:7474';

  var db = new neo4j.GraphDatabase(neo4jurl);

  var port = 8124;

  http.createServer( function(req, res) {

    console.log('Server Started ');

    var query = require('url').parse(req.url).query;
    var nodeid = require('querystring').parse(query).nodeid;


    var dbversion = db.getVersion();

    var selectednode = db.getNodeById(nodeid);

    var nodestring = selectednode.toString();

    res.writeHead(200, {'content-type': 'text/plain'});

    res.write('Welcome to the Neo4j reader !\n');
    res.write('Version ',dbversion,'\n');
    res.write('Node id ',nodeid,'\n');
    res.write('Node string \n');
    res.write(nodestring);

    res.end("Good Bye !\n");

    console.log("Node ID ", nodeid);
    console.log("Selected node ", selectednode);

  }).listen(port);


  console.log('Server running on port ', port);


Let's analyze this code line by line.


First we import the package that allows us to run an HTTP web server.



Running
-------

At this point we are ready to launch our HTTP server with the command

::

   nodejs  serverReadDatabase04.js

and now go and open a Web Browser client giving to it the IP address of our
server with the ":8124" port specification appended, and add to it the query
string.

for example

::

    firefox   http://166.78.129.118:8124/?nodeid=23


Exercise
--------

Modify the values in the "nodeid" property of the query string passed
to the URL.

To do this

* Edit the URL string in your web browser
* Refresh the page


