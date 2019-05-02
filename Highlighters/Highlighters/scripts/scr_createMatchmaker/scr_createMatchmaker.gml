var xPos = argument0;
var yPos = argument1;
var axis = argument2;
var colorIndex = argument3;

matchmaker = instance_create_layer(xPos,yPos,"Controller",obj_matchmaker);
matchmaker.axis = axis;
matchmaker.colorIndex = colorIndex;