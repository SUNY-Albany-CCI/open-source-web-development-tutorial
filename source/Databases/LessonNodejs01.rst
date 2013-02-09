Hello World
===========

To test our node.js installation we can write the following "Hello World"
example, of course in a file named HelloWorld.js

.. code-block:: javascript

  var http = require('http');
  http.createServer( function(req, res) {
    res.writeHead(200, {'content-type': 'text/plain'});
    res.end("Hello, World!\n");
  }).listen(8124);
  console.log('Server running on port 8124');


Running
-------

We can now launch this minimal HTTP server with the command

::

   nodejs  HelloWorld.js

and now go and open a Web Browser client giving to it the IP address of our
server with the ":8124" port specification appended.

for example

::

    firefox   http://166.78.129.118:8124

Exercise
--------

Now that we have run our first server, let's verify it, by changing the
message that is sent to the web browser client.

Replace the "Hello World" message with something more creative...

To do this

* Stop the server with CTRL+c
* Edit the file
* Save the file
* Launch the server again
* Refresh the page in your web browser client


