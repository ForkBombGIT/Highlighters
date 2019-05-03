var xPos = argument0;
var yPos = argument1;
var colorIndex = argument2;

matchmaker = instance_create_layer(xPos,yPos,"Controller",obj_matchmaker);
matchmaker.colorIndex = colorIndex;