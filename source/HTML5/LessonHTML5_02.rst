Lesson 02
=========

.. highlight:: html

Canvas
------

The HTML5 <`canvas`_> element is used to draw graphics, on the fly, via scripting (usually JavaScript).

You can create a canvas element with the following code

::

  <canvas id="myCanvas" width="200" height="100">

  </canvas>

The "id" attribute makes possible to refer to the canvas from a script, that is
written inside the <script> </script> tags.

Then, we can draw in the canvas by using Javascript commands.


::

  <!DOCTYPE html>
  <html>
  <body>

  <canvas id="myCanvas" width="200" height="100" style="border:1px solid #c3c3c3;">
  Your browser does not support the HTML5 canvas tag.
  </canvas>

  <script>

  var c=document.getElementById("myCanvas");
  var ctx=c.getContext("2d");
  ctx.fillStyle="#FF0000";
  ctx.fillRect(0,0,150,75);

  </script>

  </body>
  </html>


Drawing
-------

Using Javascript it is possible to draw simple geometrical figures in a canvas.

Try placing the following Javascript code in the <script> element.


Line
~~~~

::

  var c=document.getElementById("myCanvas");
  var ctx=c.getContext("2d");
  ctx.moveTo(0,0);
  ctx.lineTo(200,100);
  ctx.stroke();

See file lesson02a.html


Circle
~~~~~~

::

  var c=document.getElementById("myCanvas");
  var ctx=c.getContext("2d");
  ctx.beginPath();
  ctx.arc(95,50,40,0,2*Math.PI);
  ctx.stroke();

See file lesson02b.html

Exercise
--------

* Change the color of the rectangle, by editing the "fillStyle" attribute
* Change the size of the rectangle, by editing the arguments of the "fillRect" function
* Change the end points of the line
* Change the radius of the circle
* Change the position of the circle
* Change the circle example to draw just one quarter of a circle


References
----------

* `Canvas Element`_
* `Canvas Reference`_

.. _canvas: http://www.w3schools.com/html/html5_canvas.asp
.. _Canvas Element: http://www.w3schools.com/html/html5_canvas.asp
.. _Canvas Reference: http://www.w3schools.com/tags/ref_canvas.asp
