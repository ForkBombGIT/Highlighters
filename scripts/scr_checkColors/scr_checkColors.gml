var color = argument0;
var previousColor = argument1;

var colorMappings = ds_map_create();
ds_map_add(colorMappings, 16,  [32,128]); 
ds_map_add(colorMappings, 32,  [16,128]);
ds_map_add(colorMappings, 128, [16,32]);
ds_map_add(colorMappings, 80,  [96,144]);
ds_map_add(colorMappings, 96,  [80,144]);
ds_map_add(colorMappings, 144, [80,96]);

var colorArray = ds_map_find_value(colorMappings,previousColor);
var one = -1, two = -1;
if (colorArray != undefined) { one = colorArray[0]; two = colorArray[1]; }
return (colorArray == undefined) ? true : ((one != color) && (two != color));

	