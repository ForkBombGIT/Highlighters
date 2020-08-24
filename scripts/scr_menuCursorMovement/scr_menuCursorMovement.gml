function scr_menuCursorMovement(argument0, argument1) {
	//used for cursor movement in menus
	//keyRight and keyLeft should be defined in calling obj
	var cursorPosition = argument0;
	var keyCode = argument1;

	if (keyCode == ds_map_find_value(global.controls,"UP")) {
		switch (cursorPosition) {
			case 0:
				global.gameLevel = min(global.gameLevel + 100,global.maxLevel - 1)
				break;
		}
	}

	if (keyCode == ds_map_find_value(global.controls,"DOWN")) {
		switch (cursorPosition) {
			case 0:
				global.gameLevel = max(global.gameLevel - 100,0)
				break;
		}
	}

	if (keyCode == ds_map_find_value(global.controls,"RIGHT")) {
		switch (cursorPosition) {
			case 0:
				global.gameLevel = min(global.gameLevel + 1,global.maxLevel - 1)
				break;
			case 1:
				global.character = clamp(global.character + 1,1,global.maxChar)
				break;
		}
	}

	if (keyCode == ds_map_find_value(global.controls,"LEFT")) {
		switch (cursorPosition) {
			case 0:
				global.gameLevel = max(global.gameLevel - 1,0)
				break;
			case 1:
				global.character = clamp(global.character - 1,1,global.maxChar)
				break;
		}
	}


}
