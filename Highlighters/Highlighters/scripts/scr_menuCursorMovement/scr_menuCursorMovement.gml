var cursorPosition = argument0;
var keyCode = argument1;

if (keyCode == vk_right) {
	switch (cursorPosition) {
		case 0:
			level = clamp(level + 1,1,maxLevel)
			break;
		case 1:
			char = clamp(char + 1,0,maxChar)
			break;
		case 2: 
			board = clamp(board + 1,0,maxBoard)
			break;
		case 3:
			track = clamp(track + 1,0,maxTrack)
			break;
	}
}

if (keyCode == vk_left) {
	switch (cursorPosition) {
		case 0:
			level = clamp(level - 1,1,maxLevel)
			break;
		case 1:
			char = clamp(char - 1,0,maxChar)
			break;
		case 2: 
			board = clamp(board - 1,0,maxBoard)
			break;
		case 3:
			track = clamp(track - 1,0,maxTrack)
			break;
	}
}