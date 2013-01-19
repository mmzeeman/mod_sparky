// Example with rainbow colored balls
//
$().ready(function() {
    sparky.presets.set("rainbow", {
        padding: 5,
        line_stroke: "none",
        dot_radius: function() {
            return 1.5 + Math.random() * 3.5;
        },
        dot_fill: function() {
            var r = (~~(Math.random() * 16)).toString(16),
                g = (~~(Math.random() * 16)).toString(16),
                b = (~~(Math.random() * 16)).toString(16);
            return ["#", r, g, b].join("");
        }
    });
});