module island(model_name) {
	import(model_name);
}

// primitive 3d object for Hawaii Counties districts
module district() {
	s = 7;
	translate([3, -855, -50])
	scale([s * 0.995, s * 1.005, 1])
	linear_extrude(150)
	import("SVG/district.svg");
}

// primitive 3d object for the Big Island's shape
module outline() {
	s = 7;
	translate([3, -855, -50])
	scale([s * 0.995, s * 1.005, 1])
	linear_extrude(150)
    import("SVG/outline.svg");
}

module district_topo(island_model, h=2) {
    intersection() {
        //district(); 
        s = 7;
        translate([3, -855, -50])
        scale([s * 0.995, s * 1.005, 1])
        linear_extrude(150)
        import("SVG/district_topo.svg");
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
    text(name, 15, font=volcano_font);
}

module triangle(s) {
    polygon(points=[[0, s/2],[s/2, -s/2],[-s/2, -s/2]]);
}
module mauna_indicator(x, y) {
    translate([x, y, 0])
    triangle(15);
}

module volcano_names(color="black") {
    color(color)
    union() {
        mauna("Mauna Loa", 280, -550);
        mauna("Kīlauea", 490, -542);
        mauna("Mauna Kea", 275, -370);
        mauna("Kohala", 150, -170);
        mauna("Hualālai", 50, -330);
    }
}

module volcano_indicators() {
    linear_extrude(100)
    union() {
        mauna_indicator(283, -505); // mauna loa
        mauna_indicator(462, -535); // kilauea
        mauna_indicator(350, -295); // mauna kea
        mauna_indicator(210, -135); // kohala
        mauna_indicator(128, -372); // hualalai
    }
}

module volcano_names_topo(island_model, h=5) {
    intersection() {
        union() {
            volcano_names();
            //volcano_indicators();
        }
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
        district_name("North Kona", 135, -450);
        district_name("South Kona", 116, -595);
        district_name("N. Kohala", 103, -100);
        //district_name("South Kohala", 120, -240);
        district_name("S. Kohala", 158, -290);
        district_name("Puna", 520, -475);
        //district_name("Hamakua", 225, -400);
        district_name("Hamakua", 300, -240);
        district_name("Kau", 340, -510);
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
        town_dot(169, -216); // waikaloa
        town_dot(355, -662); // pahala
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
        town_name("Waimea", 205, -202);
        town_name("Honokaʻa", 300, -165);
        town_name("Laupāhoehoe", 370, -215);
        town_name("Hilo", 542, -393);
        town_name("Volcano", 455, -507);
        town_name("Nāʻālehu", 230, -732);
        town_name("Miloliʻi", 125, -680);
        town_name("Captain", 105, -496); town_name("Cook", 190, -496);
        town_name("Kailua Kona", 72, -415);
        town_name("Keaʻau", 565, -441);
        town_name("Pahoa", 620, -512);
        town_name("Papaikou", 470, -332);
        town_name("Honomu", 472, -289);
        town_name("Waikōloa ", 125, -240);
        town_name("Village", 135, -260);
        town_name("Pāhala", 320, -655);
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

module base(h=50) {
    x = 731;
    y = 861;
    translate([0, -y, -h])
    cube([x, y, h]);
}

i = "STL/v4.stl";

// module with all features
module puzzle_all() {
    // string name: puzzle all
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(10);
        }
        import("STL/district.stl");
    }
}

// model with all features
module model_all() {
    // string name: model all
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/outline.stl");
    }
}

module model_no_volcano_land() {
    // string name: model all
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/district_topo.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(10);
        }
        import("STL/outline.stl");
    }
}

// modules with 1 fewer feature

module puzzle_no_volcano_land() {
    // string name: puzzle nvland
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

module puzzle_no_volcano_name() {
    // string name: puzzle nvname
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

module puzzle_no_district_name() {
    // string name: puzzle ndname
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

module puzzle_no_town_name() {
    // string name: puzzle ntname
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

module puzzle_no_town_dot() {
    // string name: puzzle ntdot
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

// modules with 2 fewer feature

module puzzle_no_volcano_land_volcano_name() {
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/district_name.stl");
            import("STL/town_name.stl");
            import("STL/town_dot.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

module puzzle_no_town_name_town_dot() {
    difference() {
        union() {
            import("STL/v4.stl");
            import("STL/volcano_land.stl");
            import("STL/volcano_name.stl");
            import("STL/district_name.stl");
            base(3);
        }
        import("STL/district.stl");
    }
}

// interface to this module
// the string value of "part" determines the output when this file is run
// default is the model divided by district 
// the selected module should be specified at the command line using -D part="{module name}"

part = "";
if (part == "district") {
    district();
}
else if (part == "district name") {
    district_names_topo(i);
}
else if (part == "district topo") {
    district_topo(i);
}
else if (part == "outline") {
    outline();
}
else if (part == "town dot") {
    town_dots_topo(i);
}
else if (part == "town name") {
    town_names_topo(i);
}
else if (part == "volcano land") {
    volcano_land(i); 
}
else if (part == "volcano name") {
    volcano_names_topo(i);
}
else if (part == "model simple") {
    difference() {
        import("STL/v4.stl");
        import("STL/outline.stl");
    }
}
else if (part == "puzzle simple") {
    difference() {
        import("STL/v4.stl");
        import("STL/district.stl");
    }
}
else if (part == "puzzle all") {
    puzzle_all();
}
else if (part == "model all") {
    model_all();
}
else if (part == "model no volcano land") {
    model_no_volcano_land();
}
else if (part == "puzzle no volcano land") {
    puzzle_no_volcano_land();
}
else if (part == "puzzle no volcano name") {
    puzzle_no_volcano_name();
}
else if (part == "puzzle no district name") {
    puzzle_no_district_name();
}
else if (part == "puzzle no town name") {
    puzzle_no_town_name();
}
else if (part == "puzzle no town dot") {
    puzzle_no_town_dot();
}

/*
island(i);
color("blue")
town_names();
color("black")
district();
color("black")
volcano_names();
color("black")
town_dots();
color("black")
district_names();
*/
