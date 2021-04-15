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

module volcano_land(island_model, h=2) {
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
    translate([200, -570, 0])
    rotate(a=0, v=[0,0,1])
    text("Mauna Loa ▲", 20, font=volcano_font);
}

module kilauea() {
	linear_extrude(100)
    translate([500, -540, 0])
	rotate(a=0, v=[0,0,1])
	text("Kīlauea ▲", 20, font=volcano_font);
}

module mauna_kea() {
	linear_extrude(100)
    translate([305, -250, 0])
	rotate(a=0, v=[0,0,1])
	text("Mauna Kea ▲", 20, font=volcano_font);
}

module kohala() {
    linear_extrude(100)
    translate([160, -190, 0])
rotate(a=0, v=[0,0,1])
	text("Kohala ▲", 20, font=volcano_font);
}

module hualalai() {
	linear_extrude(100)
    translate([30, -360, 0])
	rotate(a=0, v=[0,0,1])
	text("Hualālai ▲", 20, font=volcano_font);
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

district_font = "";

module north_hilo() {
    linear_extrude(100)
    translate([325, -440, 0])
    text("North Hilo", 15);
}
module south_hilo() {
    linear_extrude(100)
    translate([425, -400, 0])
    text("South Hilo", 15);
}
module north_kona() {
    linear_extrude(100)
    translate([75, -440, 0])
    text("North Kona", 15);
}
module south_kona() {
    linear_extrude(100)
    translate([118, -595, 0])
    text("South Kona", 15);
}
module north_kohala() {
    linear_extrude(100)
    translate([110, -85, 0])
    text("N. Kohala", 15);
}
module south_kohala() {
    linear_extrude(100)
    translate([130, -250, 0])
    text("South Kohala", 15);
}
module puna() {
    linear_extrude(100)
    translate([525, -500, 0])
    text("Puna", 15);
}
module hamakua() {
    linear_extrude(100)
    translate([225, -400, 0])
    text("Hamakua", 15);
}
module kau() {
    linear_extrude(100)
    translate([340, -500, 0])
    text("Kau", 15);
}
module district_names() {
    union() {
        north_hilo();
        south_hilo();
        north_kohala();
        south_kohala();
        north_kona();
        south_kona();
        puna();
        hamakua();
        kau();
    }
}

module district_names_topo(island_model, height=5) {
    translate([0, 0, height])
    intersection() {
        district_names();

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
            color("black")
            import("STL/district names.stl");
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
            // volcano land boundaries
            color("blue")
            import("STL/volcano land.stl");
            // volcano names
            color("black")
            import("STL/volcano names.stl");
            // distric names
            color("green")
            import("STL/district names.stl");
        }
        // district divisions
        import("STL/district.stl");
    }
}

module assemble_puzzle_memory() {
    difference() {
        union() {
            // base model
            island(i);
            color("blue")
            // volcano land boundaries
            volcano_land(i);
            color("black")
            volcano_names_topo(i);
        }
        district();
    }
}

module test_view() {
    island(i);
    color("black")
    district();
    volcano_names();
    color("black")
    district_names();
}

i = "STL/v4.stl";
