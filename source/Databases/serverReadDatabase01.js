var http = require('http');

var office = require('office');



http.createServer( function(req, res) {

  res.writeHead(200, {'content-type': 'text/plain'});

  res.write('Welcome to the Spreadsheet reader !\n');

  office.parse('MyDatabase.ods', function(err, data) {
      var cellvalue = data.sheets.sheet[0].rows.row[0].cell[0]['$t'];
      console.log(cellvalue);
  });

  res.end("Good Bye !\n");

}).listen(8124);


console.log('Server running on port 8124');
