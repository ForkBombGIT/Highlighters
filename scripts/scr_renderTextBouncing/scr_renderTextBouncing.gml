// Takes an array of structs. The structs are made up of three values, value, current position, and destination position (on y axis)
// text = {
//	{
//		"value": "b",
//		"current": 0,
//		"dest": 1,
//	},
//	{
//		"value": "b",
//		"current": 1,
//		"dest": -1,
//	},,
//
//  The function will decrement/increment towards the destination values, and if current == dest, flip the dest
//}
function scr_renderTextBouncing(font,structArray,x,y,kern){
	var drawnString = "";
	var currentStructArray = structArray;
	draw_set_halign(fa_center);
	draw_set_font(font);
	for (var i = 0; i < array_length(structArray); i++) {
		var struct = array_get(structArray,i);
		var dir = struct.dest/abs(struct.dest);
		if (struct.current == struct.dest) 
			struct.dest = -struct.dest
		else struct.current += ((struct.current == struct.dest + -dir) ? 1 : 2) * dir;
		draw_text(x + string_length(drawnString) * kern, y + (struct.current * 3), struct.value);
		drawnString += struct.value;
		array_set(currentStructArray,i,struct);
	}
	draw_set_halign(fa_left);
	return currentStructArray;
}