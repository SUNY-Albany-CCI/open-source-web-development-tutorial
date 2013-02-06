Opening Excel
=============

In this exercise we are going to open an excel spreadshet from node.js and
expose its content throught a web server.

We will put the source code in a file named

      serverReadDatabase02.js

We write the following in the server file:

::

  var http = require('http');

  var parseXlsx = require('excel');


  http.createServer( function(req, res) {

    console.log('Server Started ');

    parseXlsx('ClassRoster.xlsx', function(data) {

        res.writeHead(200, {'content-type': 'text/plain'});

        res.write('Welcome to the Spreadsheet reader !\n');

        var row1   = data[0];
        var cell11 = row1[0];

        res.write("Database cell11 = ");
        res.write(cell11);
        res.write("\n");

        res.end("Good Bye !\n");

        console.log("Database cell11 = ", cell11);

    });


  }).listen(8124);


  console.log('Server running on port 8124');


Let's analyze this code line by line.


The following line imports the package that allow use to create an HTML web server

::

  var http = require('http');

The following line imports the package that allow use to read an Excel spreadsheet

::

  var parseXlsx = require('excel');


Here we start the creation of the HTML web server

::


  http.createServer( function(req, res) {

    console.log('Server Started ');

and we open the Spreadsheet file with extension .xlsx

::

    parseXlsx('ClassRoster.xlsx', function(data) {

Note that the full content of the spreadsheet will be loaded into the "data"
variable, in the form of an array of arrays. The arrays are organized in such a
way that every element of "data" corresponds to one row of the spreadsheet.


Write the usual HTML header for the message to be sent back to the Web browser
client

::

        res.writeHead(200, {'content-type': 'text/plain'});


and a happy welcoming message

::

        res.write('Welcome to the Spreadsheet reader !\n');

Now we get the first element of the "data" array, which corresponds to the
first row of the spreadsheet

::

        var row1   = data[0];

and from that row, we get the first element, which corresponds to the first
cell of that row.

::

        var cell11 = row1[0];

Then we write back the content to the web browser client

::

        res.write("Database cell11 = ");
        res.write(cell11);
        res.write("\n");

and send a courteous message to end the session

::

        res.end("Good Bye !\n");

we also print a message in the console of the web server, just to get some
feedback on what is going on.

::

        console.log("Database cell11 = ", cell11);


we close the parseXlsx function

::

    });

we close the create function

::

  }).listen(8124);

and also start listening in port 8124.

An extra message in the console helps us to remember the port number in which our web server is listening.

::

  console.log('Server running on port 8124');

At this point we are ready to launch our HTTP server with the command

::

   nodejs  HelloWorld.js

and now go and open a Web Browser client giving to it the IP address of our
server with the ":8124" port specification appended.

for example

::

    firefox   http://192.168.122.186:8124


Exercise
--------

Now that we have selected the first cell, from the first row, change the code to extract the second cell from the third row.

To do this

* Stop the server with CTRL+c
* Edit the file
* Save the file
* Launch the server again
* Refresh the page in your web browser client


