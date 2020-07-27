event_inherited();

#region Animation Control
var animSpeed = cursorFlickerSpeed;
cursorFlickerIndex += animSpeed;
if (floor(cursorFlickerIndex) > 1){
	cursorFlickerIndex = 0;
}
#endregion

//changes cursor type
switch (cursorPosition) {
	case 0: //level
		if (global.gameLevel == 0) cursorType = 0;
		else if (global.gameLevel < global.maxLevel) cursorType = 2;
		else cursorType = 4
	break;
	case 1: //character
		if (global.character - 1 == 0) cursorType = 0;
		else if (global.character - 1 < global.maxChar - 1) cursorType = 2;
		else cursorType = 4
	break;
}