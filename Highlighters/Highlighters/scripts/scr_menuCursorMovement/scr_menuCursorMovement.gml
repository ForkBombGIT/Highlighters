var cursorPosition = argument0;
var keyCode = argument1;

if (keyCode == vk_right) {
	switch (cursorPosition) {
		case 0:
			if !practice
				level = clamp(level + 1,1,maxLevel)
			break;
		case 1:
			board = clamp(board + 1,0,maxBoard)
			break;
	}
}

if (keyCode == vk_left) {
	switch (cursorPosition) {
		case 0:
			if !practice
				level = clamp(level - 1,1,maxLevel)
			break;
		case 1:
			board = clamp(board - 1,0,maxBoard)
			break;
	}
}