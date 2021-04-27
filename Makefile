current_directory = $(shell pwd)/STL/

$(current_directory)district.stl: SVG/district.svg
	openscad main.scad -D 'part="district"' -o STL/district.binstl
	@mv STL/district.binstl STL/district.stl

$(current_directory)district_name.stl:
	openscad main.scad -D 'part="district name"' -o STL/district_name.binstl
	@mv STL/district_name.binstl STL/district_name.stl

$(current_directory)district_topo.stl: SVG/district_topo.svg
	openscad main.scad -D 'part="district topo"' -o STL/district_topo.binstl
	@mv STL/district_topo.binstl STL/district_topo.stl

$(current_directory)outline.stl: SVG/outline.svg
	openscad main.scad -D 'part="outline"' -o STL/outline.binstl
	@mv STL/outline.binstl STL/outline.stl

$(current_directory)town_dot.stl: STL/v4.stl
	openscad main.scad -D 'part="town dot"' -o STL/town_dot.binstl
	@mv STL/town_dot.binstl STL/town_dot.stl

$(current_directory)town_name.stl: STL/v4.stl
	openscad main.scad -D 'part="town name"' -o STL/town_name.binstl
	@mv STL/town_name.binstl STL/town_name.stl

$(current_directory)volcano_land.stl: STL/v4.stl SVG/volcano\ boundary.svg
	openscad main.scad -D 'part="volcano land"' -o STL/volcano_land.binstl
	@mv STL/volcano_land.binstl STL/volcano_land.stl

$(current_directory)volcano_name.stl: STL/v4.stl
	openscad main.scad -D 'part="volcano name"' -o STL/volcano_name.binstl
	@mv STL/volcano_name.binstl STL/volcano_name.stl

model_simple: STL/v4.stl
	openscad main.scad -m make -D 'part="model simple"' -o out/model_simple.binstl
	@mv out/model_simple.binstl out/model_simple.stl

model_all: STL/v4.stl
	openscad main.scad -m make -D 'part="model all"' -o out/model_all.binstl
	@mv out/model_all.binstl out/model_all.stl

puzzle_simple: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle simple"' -o out/puzzle_simple.binstl
	@mv out/puzzle_simple.binstl out/puzzle_simple.stl

puzzle_all: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle all"' -o out/puzzle_all.binstl
	@mv out/puzzle_all.binstl out/puzzle_all.stl

puzzle_nvland: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle no volcano land"' -o out/puzzle_no_volcano_land.binstl
	@mv out/puzzle_no_volcano_land.binstl out/puzzle_no_volcano_land.stl

puzzle_nvname: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle no volcano name"' -o out/puzzle_no_volcano_name.binstl
	@mv out/puzzle_no_volcano_name.binstl out/puzzle_no_volcano_name.stl

puzzle_ndname: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle no district name"' -o out/puzzle_no_district_name.binstl
	@mv out/puzzle_no_district_name.binstl out/puzzle_no_district_name.stl

puzzle_ntname: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle no town name"' -o out/puzzle_no_town_name.binstl
	@mv out/puzzle_no_town_name.binstl out/puzzle_no_town_name.stl

puzzle_ntdot: STL/v4.stl
	openscad main.scad -m make -D 'part="puzzle no town dot"' -o out/puzzle_no_town_dot.binstl
	@mv out/puzzle_no_town_dot.binstl out/puzzle_no_town_dot.stl

help:
	@echo "usage: make [object]"
	@echo where object is one of the following
	@echo outline.stl, puzzle_all
