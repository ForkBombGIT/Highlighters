//used for cursor movement in menus
//keyRight and keyLeft should be defined in calling obj
var cursorPosition = argument0;
var keyCode = argument1;

if (keyCode == keyRight) {
	switch (cursorPosition) {
		case 0:
			level = clamp(level + 1,1,maxLevel)
			break;
		case 1:
			board = clamp(board + 1,0,maxBoard)
			break;
	}
}

if (keyCode == keyLeft) {
	switch (cursorPosition) {
		case 0:
			level = clamp(level - 1,1,maxLevel)
			break;
		case 1:
			board = clamp(board - 1,0,maxBoard)
			break;
	}
}