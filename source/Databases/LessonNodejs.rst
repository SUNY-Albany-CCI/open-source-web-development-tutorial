Nodejs Lesson
=============

Introduction
------------

`Node.js`_: is a server-side technology that based on Google's `V8 JavaScript engine`_.

* It's a highly scalable system that uses asynchronous, event-driven I/O (input/output), rather than threads or separate process.

* It's ideal for web applications that are frequently accessed but computationally simple.

* Programming in node.js is simply like writing Javascript, but with the difference that it will run in the server, instead of running in the Web browser client, as most Javascript code does.


Installation
------------

Installing node.js is very simple in any Debian-based Linux distribution.

Simply type

::

      sudo apt-get install nodejs


It is also possible to build Node.js from its source code by doing the following

::

     sudo apt-get install build-essential openssl libssl-dev pkg-config
     wget http://nodejs.org/dist/v0.8.18/node-v0.8.18.tar.gz
     tar -zxf node-v0.8.18.tar.gz
     cd node-v0.8.18
     ./configure
     make
     sudo make install

Once we have node.js installed, we also need to bring some Node packages in. To
do this we install also the node package manage (npm), with the command

::

      sudo apt-get install npm

Then, using npm we can install the node.js drivers for the database that we are going to use.

In this case we start with the Excel driver.

The installation of the Excel driver has a prerequisite the xml2-config
utility, that can be found in the libxml2-dev package. Therefore we install
that package first with the command:

::

     sudo apt-get install libxml2-dev

and then we proceed to install the Excel driver with the command

::

      sudo npm install excel


Another possible driver is the "office" one.

The installation of the Office driver has a prerequisite the xlhtml and unoconv
utilities, that can be found in the xlhtml and unoconv Debian packages
respectively. Therefore we install these package first with the commands:

::

     sudo apt-get install xlhtml
     sudo apt-get install unoconv

and then we proceed to install the Office driver with the command

::

      sudo npm install office


Hello World
-----------

To test our node.js installation we can write the following "Hello World"
example, of course in a file named HelloWorld.js

::

  var http = require('http');
  http.createServer( function(req, res) {
    res.writeHead(200, {'content-type': 'text/plain'});
    res.end("Hello, World!\n");
  }).listen(8124);
  console.log('Server running on port 8124');

Then we can launch this minimal HTTP server with the command

::

   nodejs  HelloWorld.js

and now go and open a Web Browser client giving to it the IP address of our
server with the ":8124" port specification appended.

for example

::

    firefox   http://192.168.122.186:8124


Now we can try opening an Excel file to use it as a database.

We write the following in the server file

::

  var parseXlsx = require('excel');

  parseXlsx('MyDatabase.xlsx', function(data) {
      // data is an array of arrays
  });



References
----------

* `Learning Node`_ by Sheelly Powers, O'Reilly, 2012.

.. _Node.js: http://nodejs.org/
.. _V8 Javascript engine: http://en.wikipedia.org/wiki/V8_%28JavaScript_engine%29
.. _Learning Node: http://shop.oreilly.com/product/0636920024606.do
