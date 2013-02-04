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


Once we have node.js installed, we also need to bring some Node packages in. To do this we install also the node package manage (npm), with the command

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

      npm install excel



References
----------

* `Learning Node`_ by Sheelly Powers, O'Reilly, 2012.

.. _Node.js: http://nodejs.org/
.. _V8 Javascript engine: http://en.wikipedia.org/wiki/V8_%28JavaScript_engine%29
.. _Learning Node: http://shop.oreilly.com/product/0636920024606.do
