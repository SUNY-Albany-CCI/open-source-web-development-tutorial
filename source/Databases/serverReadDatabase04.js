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
