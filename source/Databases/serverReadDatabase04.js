var http = require('http');

var neo4j = require('neo4j');

var neo4jurl = process.env.NEO4J_URL || 'http://localhost:7474';

var port = 8124;

http.createServer( function(req, res) {

  console.log('Server Started ');

  var query = require('url').parse(req.url).query;
  var name = require('querystring').parse(query).name;

  var graphDb = new neo4js.GraphDatabase4Node(neo4jurl);

  res.writeHead(200, {'content-type': 'text/plain'});

  res.write('Welcome to the Neo4j reader !\n');

  res.end("Good Bye !\n");

  console.log("Database name ",name);

}).listen(port);


console.log('Server running on port ',port);
