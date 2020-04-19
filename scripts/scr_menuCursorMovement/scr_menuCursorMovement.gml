//used for cursor movement in menus
//keyRight and keyLeft should be defined in calling obj
var cursorPosition = argument0;
var keyCode = argument1;

if (keyCode == ds_map_find_value(global.controls,"RIGHT")) {
	switch (cursorPosition) {
		case 0:
			global.gameLevel = clamp(global.gameLevel + 1,0,global.maxLevel - 1)
			break;
		case 1:
			board = clamp(board + 1,1,maxBoard)
			break;
	}
}

if (keyCode == ds_map_find_value(global.controls,"LEFT")) {
	switch (cursorPosition) {
		case 0:
			global.gameLevel = clamp(global.gameLevel - 1,0,global.maxLevel - 1)
			break;
		case 1:
			board = clamp(board - 1,1,maxBoard)
			break;
	}
}