Querying Excel
==============

In this exercise we are going to open an excel spreadshet from node.js and
selectively expose its content by using a query in the URL composed on the
client side.

We will put the source code in a file named

      serverReadDatabase03.js

We write the following in the server file:

::

  var http = require('http');

  var parseXlsx = require('excel');


  http.createServer( function(req, res) {

    console.log('Server Started ');

    parseXlsx('FavoriteFruit.xlsx', function(data) {

        var query = require('url').parse(req.url).query;
        var row = require('querystring').parse(query).row;
        var col = require('querystring').parse(query).col;

        res.writeHead(200, {'content-type': 'text/plain'});

        res.write('Welcome to the Spreadsheet reader !\n');

        var rowdata  = data[row];
        var celldata = rowdata[col];

        res.write("Database cell "+row+" "+col+" = ");
        res.write(celldata);
        res.write("\n");

        res.end("Good Bye !\n");

        console.log("Database cell ",row,",",col," data = ", celldata);

    });


  }).listen(8124);


  console.log('Server running on port 8124');

Let's analyze this code line by line.


First we import the package that allows us to run an HTTP web server.

::

  var http = require('http');

Then we import the package that allows us to read Excel spreadsheets.

::

  var parseXlsx = require('excel');

In the lines below we invoke the creation of the server and post a helper
message to the console.

::

  http.createServer( function(req, res) {

    console.log('Server Started ');

With the parseXlsx function below, we open the Spreadsheet file with extension
.xlsx and load all its content in the "data" variable.

::

    parseXlsx('FavoriteFruit.xlsx', function(data) {

Now we can take advantage of the "url" package and its built-in functionality to parse a query that is appended to a URL.

::

        var query = require('url').parse(req.url).query;

A query in a URL will take a form similar to

::

        http://www.example.com/?property1=value1&property2=value2

On the server side, the query string is put in an array of properties, that can in turn be checked one by one.

In our exercise we are expecting the query to have the form

        http://www.example.com/?row=5&col=3

and therefore, in our node.js code, we search for the properties

* row
* col

using the following lines of code

::

        var row = require('querystring').parse(query).row;
        var col = require('querystring').parse(query).col;

At this point, the "row" and "col" variables contain the numerical values
passed by the client in the query string of the URL.

We now continue with more standard messages.

The header for the HTTP message to be sent back to the Web browser

::

        res.writeHead(200, {'content-type': 'text/plain'});

A salutation

::

        res.write('Welcome to the Spreadsheet reader !\n');

and we use the content of the "row" variable to extract the corresponding row
from the "data" of the spreadsheet.

::

        var rowdata  = data[row];

and the content of the "col" variable to extract the cell at the corresponding
column from the row.

::

        var celldata = rowdata[col];

we use that information to compose a message to be sent to the web browser client

::

        res.write("Database cell "+row+" "+col+" = ");
        res.write(celldata);
        res.write("\n");

and close the session with a courteous message

::

        res.end("Good Bye !\n");

we also print a message in the console of the web server, just to get some
feedback on what is going on.

::

        console.log("Database cell ",row,",",col," data = ", celldata);

we close the parseXlsx function

::

    });


we close the createServer function

::

  }).listen(8124);


and also start listening in port 8124.

An extra message in the console helps us to remember the port number in which
our web server is listening.

::

  console.log('Server running on port 8124');



Running
-------

At this point we are ready to launch our HTTP server with the command

::

   nodejs  serverReadDatabase03.js

and now go and open a Web Browser client giving to it the IP address of our
server with the ":8124" port specification appended, and add to it the query
string.

for example

::

    firefox   http://166.78.129.118:8124/?row=3&col=2


Exercise
--------

Modify the values in the "row" and "col" properties of the query string passed
to the URL.

To do this

* Edit the URL string in your web browser
* Refresh the page


