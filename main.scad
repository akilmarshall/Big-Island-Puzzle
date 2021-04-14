module island(model_name) {
	import(model_name);
}

/*
module puzzle(island_model, show_island=true, show_volcano_land=true, show_volcano_names=true, show_district=true) {
	// final module, assembles the puzzle
    // causes CGAL cache insert failed difference()
    // errors but produces a stl file
    difference() {
        union() {
            if (show_island) {
                island(island_model);
            }
            if (show_volcano_land) {
                volcano_land(island_model);
                }
            if (show_volcano_names) {
                    volcano_names(island_model, 5, "purple");
            }
        }
        if (show_district) {
            district();
        }
    }
}
*/

module district() {
	s = 7;
	translate([3, -855, -1])
	scale([s * 0.995, s * 1.005, 1])
	linear_extrude(100)
	import("SVG/district.svg");
}

module volcano_land(island_model, h=5) {
    translate([0, 0, h])
    intersection() {
        island(island_model);

        s = 8.0;
        color("blue")
        translate([-40, -850, 0])
        scale([s, s * 0.99, 1])
        linear_extrude(100)
        offset(r=0.1)
        import("SVG/volcano boundary.svg");
    }
}

volcano_font = "Constantia:style=Bold";

module mauna_loa() {
    linear_extrude(100)
    translate([305, -605, 0])
    rotate(a=45, v=[0,0,1])
    text("Mauna Loa", 20, font=volcano_font);
}

module kilauea() {
	linear_extrude(100)
    translate([500, -550, 0])
	rotate(a=0, v=[0,0,1])
	text("Kilauea", 20, font=volcano_font);
}

module mauna_kea() {
	linear_extrude(100)
    translate([305, -225, 0])
	rotate(a=0, v=[0,0,1])
	text("Mauna Kea", 20, font=volcano_font);
}

module kohala() {
    linear_extrude(100)
    translate([120, -60, 0])
rotate(a=-80, v=[0,0,1])
	text("Kohala", 20, font=volcano_font);
}

module hualalai() {
	linear_extrude(100)
    translate([65, -310, 0])
	rotate(a=-80, v=[0,0,1])
	text("Hualalai", 20, font=volcano_font);
}

module volcano_names(island_model, color="black") {
    color(color)
    union() {
        mauna_loa();
        kilauea();
        mauna_kea();
        kohala();
        hualalai();
    }
}

module volcano_names_topo(island_model, height=5) {
    translate([0, 0, height])
    intersection() {
        volcano_names(island_model);
        island(island_model);
    }
}

module compile_districts() {
	// after the puzzle stl has been split into seperate district files this module
	// unions them back into on stl file
	union() {
		import("STL/North Hilo.stl");
		import("STL/South Hilo.stl");
		import("STL/North Kohala.stl");
		import("STL/South Kohala.stl");
		import("STL/North Kona.stl");
		import("STL/South Kona.stl");
		import("STL/Puna.stl");
		import("STL/Kau.stl");
		import("STL/Hamakua.stl");
	}
}


i = "STL/v4.stl";
//mauna_loa(i, 5, "black");

// island | volcano land | volcano names | district
//puzzle(i, false, false, true, false);
//import("out.stl");

// assemble a solid model with geographic information
module assemble_model() {
    intersection() {
        union() {
            // base model
            island(i);
            color("blue")
            // volcano land boundaries
            import("STL/volcano land.stl");
            color("black")
            import("STL/volcano names.stl");
        }
        hull() {
            district();
        }
    }
}

// assemble the current available 3d objects into the puzzle
module assemble_puzzle() {
    difference() {
        union() {
            // base model
            island(i);
            color("blue")
            // volcano land boundaries
            import("STL/volcano land.stl");
            color("black")
            import("STL/volcano names.stl");
        }
        import("STL/district.stl");
    }
}
