var http = require('http');

var parseXlsx = require('excel');


http.createServer( function(req, res) {

  console.log('Server Started ');

  // var cellvalue = data.sheets.sheet[0].rows.row[0].cell[0]['$t'];

  // console.log("Cell =",cellvalue);

  parseXlsx('ClassRoster.xlsx', function(data) {

      // data is an array of arrays
      res.writeHead(200, {'content-type': 'text/plain'});

      res.write('Welcome to the Spreadsheet reader !\n');

      var row1   = data[0];
      var cell11 = row1[0];

      res.write("Database cell11 = ");
      res.write(cell11);
      res.write("\n");

      res.end("Good Bye !\n");

      console.log(cell11);

  });


}).listen(8124);


console.log('Server running on port 8124');
