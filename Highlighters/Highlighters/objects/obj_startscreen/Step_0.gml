#region Menu Animation
var startFlicker = 0.033;
if (round(startFlickerIndex) < 2){
    startFlickerIndex += startFlicker;
} else startFlickerIndex = 0;

var optionAnimation = 0.2;
if (round(optionAnimationIndex) < 7){
    optionAnimationIndex += optionAnimation;
} else optionAnimationIndex = 1;

var optionBackgroundAnimation = 0.2;
if (round(optionBackgroundAnimationIndex) < 32){
    optionBackgroundAnimationIndex += optionBackgroundAnimation;
} else optionBackgroundAnimationIndex = 0;
#endregion
#region Menu Navigation
if (start != 0) {
	//menu item selection
	if (keyboard_check_pressed(keyB)) {
		if (start == 4) start = 2;
		start--; flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}	
	
	if (keyboard_check_pressed(vk_anykey)) {
		//moving up and down
		if (keyboard_key == keyUp) 
			cursorPosition = clamp(cursorPosition - 1,0,(start == 2 || start == 3) ? 1 : 2);
		else if (keyboard_key == keyDown) 
			cursorPosition = clamp(cursorPosition + 1,0,(start == 2 || start == 3) ? 1 : 2);
	}
}

switch (start) {
	case 0:
		//menu item selection
		if (keyboard_check_pressed(keyA) || keyboard_check_pressed(keySelect)) {
			start = 1; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		break;
	case 1:
		if (keyboard_check_pressed(keyA) || keyboard_check_pressed(keySelect)) {
			switch (cursorPosition) {
				case 0: //classic
					start = 5;
				case 1: //practice
					if (start == 1) start = 4; 
					flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
				case 2: //options
					start = 2; flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
			}
		}
		break;
	case 2:
		option = -1;
		if (keyboard_check_pressed(keyA) || keyboard_check_pressed(keySelect)) {
			switch (cursorPosition) {
				case 0: //input
					option = 0
				case 1: //audio video
					if (option == -1) option = 1;
					start = 3;
					flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
			}
		}
		break;
	case 3:
		break;
	case 4:
		if (keyboard_check_pressed(keyA) || keyboard_check_pressed(keySelect)) {
			start++;
			practice = true;
		}
		break;
	case 5:
		var startGame = instance_create_layer(0,0,"Instances",obj_startGame);
		startGame.practice = practice;
		startGame.keyA = keyA;
		startGame.keyB = keyB;
		startGame.keySelect = keySelect;
		startGame.keyUp = keyUp;
		startGame.keyDown = keyDown;
		startGame.keyLeft = keyLeft;
		startGame.keyRight = keyRight;
		startGame.keyPause = keyPause;
		startGame.keyOff = keyOff;
		instance_destroy();
		break;
}
#endregion