// Example big sparkline.
$().ready(function() {
    sparky.presets.set("big", {
        width: 450,
        height: 100,
        padding: 10,
        line_stroke: "red",
        line_stroke_width: 2,
        dot_radius: function(d, i) {
            return this.last ? 5 : 0;
        },
        dot_fill: "red",
        dot_stroke: "white",
        dot_stroke_width: 1
    });
});