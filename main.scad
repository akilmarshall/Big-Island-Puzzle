module island(model_name) {
	import(model_name);
}

module puzzle() {
	// final module, assembles the puzzle
    difference() {
        island("STL/v4.stl");
        color("blue")
        district();
    }
}

module district() {
	s = 7;
	translate([3, -855, -1])
	scale([s * 0.995, s * 1.005, 1])
	linear_extrude(100)
	import("SVG/district.svg");
}

puzzle();