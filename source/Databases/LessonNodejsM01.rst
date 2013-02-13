NodeJS M
========

In this examples we illustrate the use of the M database from node.js.

M is a NoSQL hierarchical database that is widely used in healthcare and
financial applications.


Installing M
------------

`Instructions for installing M`_ are available here

* https://www.opensourcesoftwarepractice.org/OSDB-Tutorial/M/Installation.html


Installing NodeM
----------------

The Node.js module that provides the drivers for the M database is called: `NodeM`_

It can be installed with the command

::

    sudo npm install nodem


Hello World
-----------

The basic usage of M from node.js can start with the following example

::


  var http = require('http');

  var nodem = require('nodem');

  var db = new nodem.Gtm();

  var port = 8124;

  http.createServer( function(req, res) {

    console.log('Server Started ');

    db.open();

    var node;

    node = {global: 'myGlobal', subscripts: ["testing", i], data: setglobal};

    db.set(node);

    db.close()


    res.writeHead(200, {'content-type': 'text/plain'});

    res.write('Welcome to the M reader !\n');

    res.write('Added ',setglobal,' to database');

    res.end("Good Bye !\n");

  }).listen(port);


  console.log('Server running on port ', port);


.. _Instructions for installing M: https://www.opensourcesoftwarepractice.org/OSDB-Tutorial/M/Installation.html

.. _NodeM: https://npmjs.org/package/nodem
