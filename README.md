# Big Island Puzzle

A topographic "puzzle" of the Big Island split by district and embellished with geographic information.
Heavy usage of union, intersection, and difference.

The architecture of the puzzle is simple and is defined as the union of its distinct (often overlapping) components represented as 3D objects.

## Terrain Data

Terrain data for the Big Island was acquired from [this](https://jthatch.com/Terrain2STL/) site.
Verticality was exaggerated by a factor of 4 to produce [v4.stl](STL/v4.stl).
In addition Autodesk Netfabb was used to repair the file using the extended repair setting.

## District Data

![district.png](img/district.png) was attained by editing [this](https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/HawaiiIslandDistricts-numbered.svg/1280px-HawaiiIslandDistricts-numbered.svg.png?1618303638911) image.
[district.svg](SVG/district.svg) was created using district.png and [this](https://picsvg.com) site.

Todo:

- ~~Create the district module which needs to correctly position district.svg spatially and linearly\_extrude the model such that it is able to be used in a difference operation to divide v4.stl into a number of pieces ~~

Next steps:

- ~~Use the district module in a difference operation with the final fully embellished v4.stl~~

## Volcano Land Data

![old](https://www.lovebigisland.com/wp-content/uploads/200px-Location_Hawaii_Volcanoes.svg_.png)

![new](https://www.hawaii-guide.com/images/body_images/Hawaii_Big_Island_Volcanoes_by_Land_Area_Map.jpg)

The original image data was attained  [here](https://www.lovebigisland.com/wp-content/uploads/200px-Location_Hawaii_Volcanoes.svg_.png) site, however it disagrees with v4.stl producing a slightly incorrect result (Kilauea only contains half of it's caldera).

edit: I was able to massage the scaling of the first image to more suitable divide the volcano's slopes. 


Thus [this](https://www.hawaii-guide.com/images/body_images/Hawaii_Big_Island_Volcanoes_by_Land_Area_Map.jpg) will be used as an alternative image source.
The image data is edited and converted to vector graphics using [this](https://picsvg.com) site.

Todo:

- ~~edit the image source to create a suitable vector for use in a 3D environment~~
- ~~Check and clean the vector in Inkscape~~
- ~~Create the volcano\_land module that correctly positions and scales the vector to cover v4.stl and linearly\_extrude such that its use in an intersection operation with v4.stl will be maximally large 3D object~~

Next steps:

- ~~Create the volcano\_land\_topo\_data module which is the intersection of volcano\_land\_data and v4.stl, the idea being that this object and be scaled vertically and then unioned with v4.stl to create a topographic model with raised portions to distinguish the slopes of each volcano~~

## Geographical Data

Town list:

- Hilo
- Volcano
- Na'alehu
- Mioli'i
- Captain Cook
- Kailua Kona
- Hawi
- Waimea
- Honoka'a
- Laupahoehoe

Todo:

- ~~Come up with a list of towns to include~~
- Add
    - ~~Honomu~~
    - ~~Papaikou~~
    - ~~Kea'au~~
    - ~~Pahoa~~

- ~~Decide on how to denote the location (dot? nothing?) of and text style (italic? different font?) of the towns~~
- ~~Decide on how to textually stylize the district names~~
- ~~Decide on how to textually stylize the volcano names~~
- ~~Find and denote reference material to use for geographic positioning~~

Next steps:

- ~~Create a module for each town's name rendering the text and linearly extruding it to be unioned into the final v4.stl~~
- ~~Create a module for each town's "dot" (to be differenced from the final v4.stl)~~
- ~~Create a module for each district's name rendering the text and linearly extruding it to be union into the final v4.stl~~
- ~~Create a module for each volcano's name rendering the text and linearly extruding it to be union into the final v4.stl~~
- ~~Create a module for the set of town names, district names, volcano names and dot modules respectively~~
