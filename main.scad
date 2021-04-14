module island(model_name) {
	import(model_name);
}

module puzzle(island_model) {
	// final module, assembles the puzzle
    
    // causes CGAL cache insert failed difference()
    // errors but produces a stl file
    difference() {
        union() {
            island(island_model);
            volcano_land(island_model);
            volcano_names();
        }
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

module volcano_land(island_model, s=1.3) {
    scale([1, 1, s])
    intersection() {
        s = 8.0;
        translate([-40, -850, 0])
        scale([s, s * 0.99, 1])
        color("red")
        linear_extrude(100)
        import("SVG/volcano boundary.svg");
        
        island(island_model);
    }
}

volcano_font = "Constantia:style=Bold";

module mauna_loa(c="black") {
    color(c)
	linear_extrude(60)
    translate([305, -605, 0])
	rotate(a=45, v=[0,0,1])
	
	text("Mauna Loa", 20, font=volcano_font);
}

module kilauea(c="black") {
    color(c)
	linear_extrude(30)
    translate([500, -550, 0])
	rotate(a=0, v=[0,0,1])
	
	text("Kilauea", 20, font=volcano_font);
}

module mauna_kea(c="black") {
    color(c)
	linear_extrude(50)
    translate([305, -225, 0])
	rotate(a=0, v=[0,0,1])
	
	text("Mauna Kea", 20, font=volcano_font);
}

module kohala(c="black") {
    color(c)
    linear_extrude(40)
    translate([120, -60, 0])
rotate(a=-80, v=[0,0,1])
	
	text("Kohala", 20, font=volcano_font);
}

module hualalai(c="black") {
    color(c)
	linear_extrude(35)
    translate([65, -310, 0])
	rotate(a=-80, v=[0,0,1])
	
	text("Hualalai", 20, font=volcano_font);
}

module volcano_names() {
    union() {
        mauna_loa();
        kilauea();
        mauna_kea();
        kohala();
        hualalai();
    }
    
}

module compile_districts() {
	// after the puzzle stl has been split into seperate district files this module
	// unions them back into on stl file
	union() {
		import("out/North Hilo.stl");
		import("out/South Hilo.stl");
		import("out/North Kohala.stl");
		import("out/South Kohala.stl");
		import("out/North Kona.stl");
		import("out/South Kona.stl");
		import("out/South Puna.stl");
		import("out/North Kau.stl");
		import("out/South Hamakua.stl");
	}
}


i = "STL/v4.stl";

puzzle(i);

