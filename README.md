mod_sparky
==========

Mod_sparky allows you to easily create sparklines in pages on your 
[Zotonic](http://zotonic.com) site.

I've always loved the little graphics called 
[sparklines](http://en.wikipedia.org/wiki/Sparkline). In the words of 
[Edward Tufte](http://www.edwardtufte.com/tufte/):

> Sparklines mean that graphics are no longer cartoonish special occasions 
> with captions and boxes, but rather a sparkline graphic can be everywhere a
> word or number can be: embedded in a sentence, table, headline, map,
> spreadsheet, graphic.

Now you can add them to your Zotonic site too!

Once you enable the mod_sparky you can embed them in your templates like this:

	'''
	{% sparkline points=[145,136,145,136,127,136,145,136,136,172,127,136,
		127,127,172,172,181,172,200,127,136,118,109,100,128] 
		preset="hilite-peaks"
		label="Glucose" %}
	'''

This will generate a sparkline with a label and display labels
for the start and stop variables and the minimum and maximum value of the 
numbers.

All the rendering is done by [sparky.js](http://prag.ma/code/sparky/) 
designed by [Shawn Allen](http://stamen.com/studio/shawn) and a little
help from [rafael.js](http://raphaeljs.com/).

prerequisites
-------------

You have to have include some css, ```css/sparky.css``` and load 
and initialize the javascript libraries responsible for rendering the 
sparkline by including ```{% include "_js_include_sparky.tpl" %}``` in
your template.


