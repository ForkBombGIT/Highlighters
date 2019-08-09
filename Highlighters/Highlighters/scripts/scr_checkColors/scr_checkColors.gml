var color = argument0;
var previousColor = argument1;

var colorMappings = ds_map_create();
ds_map_add(colorMappings, 11, [22,88]);
ds_map_add(colorMappings, 22, [11,88]);
ds_map_add(colorMappings, 88, [11,22]);
ds_map_add(colorMappings, 55, [66,99]);
ds_map_add(colorMappings, 66, [55,99]);
ds_map_add(colorMappings, 99, [55,66]);

var colorArray = ds_map_find_value(colorMappings,previousColor);
var one = -1, two = -1;
if (colorArray != undefined) { one = colorArray[0]; two = colorArray[1]; }
return (colorArray == undefined) ? true : ((one != color) && (two != color));

	