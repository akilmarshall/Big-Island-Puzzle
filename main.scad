module island(model_name) {
	import(model_name);
}

module district() {
	s = 7;
	translate([3, -855, -50])
	scale([s * 0.995, s * 1.005, 1])
	linear_extrude(150)
	import("SVG/district.svg");
}

module district_topo(island_model, h=2) {
    intersection() {
        district(); 
        translate([0, 0, h])
        union() {
            island(island_model);
            base(h + 1);
        }
    }
}

module volcano_land(island_model, h=1) {
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

module mauna(name, x, y) {
    linear_extrude(100)
    translate([x, y, 0])
    rotate(a=0, v=[0,0,1])
    text(name, 20, font=volcano_font);
}

module volcano_names(island_model, color="black") {
    color(color)
    union() {
        mauna("Mauna Loa ▲", 200, -570);
        mauna("Kīlauea ▲", 500, -560);
        mauna("Mauna Kea ▲", 305, -250);
        mauna("Kohala ▲", 150, -170);
        mauna("Hualālai ▲", 30, -360);
    }
}

module volcano_names_topo(island_model, h=5) {
    intersection() {
        volcano_names(island_model);
        translate([0, 0, h])
        union() {
            island(island_model);
            base(h + 1);
        }
    }
}

module district_name(name, x, y) {
    linear_extrude(100)
    translate([x, y, 0])
    text(name, 15, font="Nimbus Sans:style=Bold");
}

module district_names() {
    union() {
        district_name("North Hilo", 321, -447);
        district_name("South Hilo", 435, -420);
        district_name("North Kona", 140, -450);
        district_name("South Kona", 116, -595);
        district_name("N. Kohala", 108, -100);
        district_name("South Kohala", 120, -240);
        district_name("Puna", 520, -475);
        district_name("Hamakua", 225, -400);
        district_name("Kau", 340, -500);
    }
}

module district_names_topo(island_model, h=5) {
    intersection() {
        district_names();
        translate([0, 0, h])
        union() {
            island(island_model);
            base(h + 1);
        }
    }
}

module town_dot(x, y, r=4) {
    translate([x, y, 0])
    cylinder(h=100, r=r);
}

module town_dots() {
    union() {
        town_dot(150, -50);   // hawi
        town_dot(240, -180);  // waimea
        town_dot(63, -408);   // kailua
        town_dot(100, -490);  // captain cook
        town_dot(117, -675);  // milolii
        town_dot(283, -743);  // naalehu
        town_dot(483, -518);  // volcano
        town_dot(557, -370);  // hilo
        town_dot(469, -193);  // laupahoehoe
        town_dot(342, -145);  // honokaa
        town_dot(557, -315);  // papaikou
        town_dot(547, -270);  // honomu
        town_dot(594, -420);  // keaau
        town_dot(648, -490);  // pahoa
    }
}

module town_name(name, x, y) {
    translate([x, y, 0])
    linear_extrude(100)
    text(name, size=15, font="Cantarell:style=Bold");
}

module town_names() {
    union() {
        town_name("Hawi", 130, -70);
        town_name("Waimea", 200, -200);
        town_name("Honokaʻa", 300, -165);
        town_name("Laupāhoehoe", 375, -220);
        town_name("Hilo", 542, -393);
        town_name("Volcano", 455, -507);
        town_name("Nāʻālehu", 230, -732);
        town_name("Miloliʻi", 125, -680);
        town_name("Captain", 105, -496); town_name("Cook", 190, -496);
        town_name("Kailua Kona", 72, -415);
        town_name("Keaʻau", 560, -440);
        town_name("Pahoa", 620, -510);
        town_name("Papaikou", 470, -332);
        town_name("Honomu", 472, -289);
    }
}

module town_names_topo(island_model, h=5) {
    intersection() {
        town_names();
        translate([0, 0, h])
        union() {
            island(island_model);
            base(h + 1);
        }
    }
}

module town_dots_topo(island_model, h=3) {
    intersection() {
        town_dots();
        translate([0, 0, h])
        union() {
            island(island_model);
            base(h + 1);
        }
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

module base() {
    s = 2.34;
    translate([1, -850, -2])
    color("blue")
    scale([s, s, 1])
    linear_extrude(2)
    import("SVG/shape.svg");
}

module want() {
    s = 2.35;
    translate([-1, -848, -5])
    color("blue")
    scale([s, s, 1])
    linear_extrude(200)
    import("SVG/shape.svg");
}

// compute all 3D objects in memory into the final puzzle
module assemble_memory(island_model) {
    difference() {
            union() {
                island(i);
                volcano_land(island_model);
                volcano_names_topo(island_model);
                town_names_topo(island_model);
                town_dots_topo(island_model);
                district_names_topo(island_model);
                base(3);
            }
        district();
    }
}

module base(h=50) {
    x = 731;
    y = 861;
    translate([0, -y, -h])
    cube([x, y, h]);
}


i = "STL/v4.stl";
