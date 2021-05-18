# Big Island Puzzle

A topographic "puzzle" of the Big Island split by district and embellished with geographic information.
Designed with 3D printing in mind, if using a FDM printer a scale of 30% or larger is advised. 

![animated gif](img/animation.gif)

(a better gif coming soon..)

## Theory

Since boolean operations are closed on 3D objects, the goal of this project is to describe the puzzle as the composition of boolean opeartions on component 3D objects.

Since openscad provides functions to compute boolean opeartions the "hard" work is in writing modules for each component part of the puzzle.

This is quite handy as each feature set can be designed and used independently of the other features.
Moreover as long as the module results in a 3D objects it's implementation details do not matter, i.e. the town names feature is extruded text using primitive openscad functions whereas the district feature is a linearly extruded vector image.



## Requirements

- openscad 2020 version
- [v4.stl](STL/v4.stl)
- [district.svg](district.svg)
- [outline.svg](outline.svg)
- [shape.svg](shape.svg)
- [volcano boundary.svg](volcano boundary.svg)


## How to Build

A Makefile is included with this project that functions as a build system.
One must specify a top level object to assemble, i.e. "puzzle_all" and then one can simply 

```
$ make puzzle_all
```


This will construct a puzzle object with all features, sub objects will be constructed as necessary and reused in the future.
The following is a list of make targets:

- model_simple
- model_all
- puzzle_simple
- puzzle_all: puzzle with all features
- puzzle_nvland: puzzle with all features except the volcano land boundaries
- puzzle_nvname: puzzle with all features except the volcano names
- puzzle_ndname: puzzle with all features except the district names
- puzzle_ntname: puzzle with all features except the town names
- puzzle_ntdot: puzzle with all features except the town names 

Note: A puzzle is a model that has been split by district.

## License

Commercial use of this project is restricted.

For non commercial use, attribution is required.
