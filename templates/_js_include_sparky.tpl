{% lib
	"js/raphael-min.js"
	"js/sparky.js"
%}
{% javascript %}
	$(".sparkline").each(function(_i, el) {
		var $el = $(el),
		    data = sparky.parse.numbers($el.data("points")),
            preset = sparky.presets.get($el.data("preset")),
            options = sparky.util.getElementOptions(el, preset);
        sparky.sparkline(el, data, options);
	})
{% endjavascript %}
