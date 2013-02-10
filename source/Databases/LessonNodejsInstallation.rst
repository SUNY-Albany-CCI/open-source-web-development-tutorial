Installation
============

Nodejs
------

Linux Package
~~~~~~~~~~~~~

Installing `Node.js`_ is very simple in any Debian-based Linux distribution.

Simply type

::

      sudo apt-get install nodejs

Unfortunately, the Linux package distribution is using nodejs 0.6.

In order to use a newer version our best option is to built it form source code.


Build from Source
~~~~~~~~~~~~~~~~~

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


Excel Driver
~~~~~~~~~~~~

In this case we start with the Excel driver.

The installation of the Excel driver has a prerequisite the xml2-config
utility, that can be found in the libxml2-dev package. Therefore we install
that package first with the command:

::

     sudo apt-get install libxml2-dev

and then we proceed to install the Excel driver with the command

::

      sudo npm install excel


Office Driver
~~~~~~~~~~~~~

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



Neo4j Driver
~~~~~~~~~~~~

We can also install the modules for the Neo4j database with the commands

::

      sudo npn  install  request
      sudo npn  install  neo4j


Destination
~~~~~~~~~~~

All these modules are ultimately located at

::

      /usr/local/lib/node

and

::

      /usr/local/lib/node_modules/npm/node_modules



.. _Node.js: http://nodejs.org/

