Lesson 00
=========

Your Sever
----------

.. highlight:: html

In this tutorial you will be using a Linux server.

An account has been created for you in this server.

Your Home Page
--------------

It is possible to expose HTML files from your home directory by doing the following

* Log in into the server
* Create a "public_html" directory in your home directory
* Set the proper permissions for the directory
* Write an index.html file in the public_html directory
* Set the proper permissions for the index.html
* Test from a web browser

More specifically, you want to use the following commands.


Create Directory
~~~~~~~~~~~~~~~~

Create the directory and set its permissions

::

   cd      ~
   mkdir   ~/public_html
   chmod   755   ~/public_html


Create Index
~~~~~~~~~~~~

Write an index.html file


::

   nano    ~/public_html/index.html


Put in there the following content

::

  <!DOCTYPE html>
  <html>
  <head>
  <title>My Home Page</title>
  </head>

  <body>
  Welcome to My Home Page !
  </body>

  </html>


In `nano`_, use the commands

* CTRL+O to save the file
* CTRL+X to quit the editor


Set proper permissions for the file, with the command:

::

   chmod   644  ~/public_html/index.html


Test
~~~~

Test the page from an external Web Browser, using the URL

::

    http://166.78.129.118/~ibanez

Of course, replacing "ibanez" with your actual user name in that Linux server.

Please not that you must use the "~" symbol to indicate that you are using your
home page.



Exercise
--------

* Customize the index.html file representing your home page.
* Don't be shy, Express yourself !

.. _nano: http://en.wikipedia.org/wiki/GNU_nano

