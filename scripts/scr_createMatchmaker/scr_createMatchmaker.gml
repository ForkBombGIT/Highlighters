function scr_createMatchmaker(argument0, argument1, argument2) {
	var xPos = argument0;
	var yPos = argument1;
	var colorIndex = argument2;

	var matchmaker = instance_create_layer(xPos,yPos,"GUI",obj_matchmaker);
	matchmaker.colorIndex = colorIndex;

	return matchmaker;


}
