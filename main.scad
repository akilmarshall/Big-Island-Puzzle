module island(model_name) {
	import(model_name);
}

module puzzle() {
	// final module, assembles the puzzle
    
    // causes CGAL cache insert failed difference()
    // errors but produces a stl file
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