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
    translate([500, -560, 0])
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
    translate([150, -170, 0])
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

module district_name(name, x, y, size=15) {
    linear_extrude(100)
    translate([x, y, 0])
    text(name, size);
}

module district_names() {
    union() {
        district_name("North Hilo", 325, -440);
        district_name("South Hilo", 435, -420);
        district_name("North Kona", 140, -450);
        district_name("South Kona", 118, -595);
        district_name("N. Kohala", 108, -100);
        district_name("South Kohala", 130, -250);
        district_name("Puna", 520, -475);
        district_name("Hamakua", 225, -400);
        district_name("Kau", 340, -500);
    }
}

module district_names_topo(island_model, height=5) {
    translate([0, 0, height])
    intersection() {
        district_names();

        island(island_model);
    }
}

module town_dot(x, y, r=4) {
    translate([x, y, 0])
    cylinder(h=100, r=r);
}

module hawi_dot() {
    town_dot(150, -50);
}

module waimea_dot() {
    town_dot(240, -180);
}

module kailua_kona_dot() {
    town_dot(63, -408);
}

module captain_cook_dot() {
    town_dot(100, -490);
}

module milolii_dot() {
    town_dot(117, -675);
}

module naalehu_dot() {
    town_dot(283, -743);
}

module volcano_dot() {
    town_dot(483, -518);
}

module hilo_dot() {
    town_dot(557, -370);
}

module laupahoehoe_dot() {
    town_dot(469, -193);
}

module honokaa_dot() {
    town_dot(342, -145);
}

module papaikou_dot() {
    town_dot(557, -315);
}

module honomu_dot() {
    town_dot(547, -270);
}

module keaau_dot() {
    town_dot(594, -420);
}

module pahoa_dot() {
    town_dot(648, -490);
}

module town_dots() {
    union() {
        hawi_dot();
        waimea_dot();
        kailua_kona_dot();
        captain_cook_dot();
        milolii_dot();
        naalehu_dot();
        volcano_dot();
        hilo_dot();
        laupahoehoe_dot();
        honokaa_dot();
        papaikou_dot();
        honomu_dot();
        keaau_dot();
        pahoa_dot();
    }
}

module town_name(name, x, y, size=14) {
    linear_extrude(100)
    translate([x, y, 0])
    text(name, size=size);
}

module hawi() {
    town_name("Hawi", 130, -70);
}

module waimea() {
    town_name("Waimea", 208, -200);
}

module honokaa() {
    town_name("Honokaʻa", 300, -165);
}

module laupahoehoe() {
    town_name("Laupāhoehoe", 380, -220);
}

module hilo() {
    town_name("Hilo", 542, -393);
}

module volcano() {
    town_name("Volcano", 455, -507);
}

module naalehu() {
    town_name("Nāʻālehu", 230, -732);
}

module milolii() {
    town_name("Miloliʻi", 125, -680);
}

module captain_cook() {
    town_name("Captain Cook", 110, -495);
}

module kailua_kona() {
    town_name("Kailua Kona", 72, -415);
}

module keaau() {
    town_name("Keaʻau", 560, -440);
}

module town_names() {
    union() {
        hawi();
        waimea();
        honokaa();
        laupahoehoe();
        hilo();
        volcano();
        naalehu();
        milolii();
        captain_cook();
        kailua_kona();
        keaau();
        town_name("Pahoa", 620, -510);
        town_name("Papaikou", 475, -332);
        town_name("Honomu", 472, -289);
    }
}

module town_names_topo(island_model, h=5) {
    translate([0, 0, h])
    intersection() {
        town_names();
        island(island_model);
    }
}

module town_dots_topo(island_model, h=2) {
    translate([0, 0, h])
    intersection() {
        town_dots();
        island(island_model);
    }
}

// import precomputed 3d models into the final puzzle
// currently broken
module assemble() {
    difference() {
        union() {
            // base model
            island(i);
            // volcano land boundaries
            color("black")
            import("STL/volcano land.stl");
            // volcano names
            color("black")
            import("STL/volcano names.stl");
            // distric names
            color("black")
            import("STL/district names.stl");
            color("black")
            import("STL/town dots.stl");
        }
        // district divisions
        import("STL/district.stl");
    }
}

// compute all 3D objects in memory into the final puzzle
module assemble_memory(island_model) {
    difference() {
        union() {
            // base model
            island(i);
            color("blue")
            // volcano land boundaries
            volcano_land(island_model);
            color("black")
            volcano_names_topo(island_model);
            color("black")
            town_names_topo(island_model);
            color("black")
            town_dots_topo(island_model);
            color("black")
            district_names_topo(island_model);
        }
        district();
    }
}

module test_view() {
    island(i);
    color("black")
    district();
    color("black")
    town_dots();
    color("black")
    town_names();
    color("black")
    district_names();
    color("black")
    volcano_names();
}

i = "STL/v4.stl";
//assemble_memory(i);
//test_view();
//test_view();
