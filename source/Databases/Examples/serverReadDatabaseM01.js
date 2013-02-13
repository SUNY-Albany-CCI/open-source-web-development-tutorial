var http = require('http');

var nodem = require('nodem');

var db = new nodem.Gtm();

var port = 8124;

http.createServer( function(req, res) {

  console.log('Server Started ');

  var query = require('url').parse(req.url).query;
  var setglobal = require('querystring').parse(query).setglobal;

  console.log('Before opening database');
  db.open();
  console.log('After opening database');

  var node;

  console.log('Testing the set command: ' + setglobal);

  node = {global: 'myGlobal', subscripts: ["testing", i], data: setglobal};

  db.set(node);

  db.close()


  res.writeHead(200, {'content-type': 'text/plain'});

  res.write('Welcome to the M reader !\n');

  res.write('Added ',setglobal,' to database');

  res.end("Good Bye !\n");

}).listen(port);


console.log('Server running on port ', port);
