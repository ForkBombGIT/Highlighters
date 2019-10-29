#region Menu Animation
var startFlicker = 0.033;
if (round(startFlickerIndex) < 2){
    startFlickerIndex += startFlicker;
} else startFlickerIndex = 0;

var optionAnimation = 0.2;
if (round(optionAnimationIndex) < 7){
    optionAnimationIndex += optionAnimation;
} else optionAnimationIndex = 1;

#endregion

switch (start) {
	case 0:
		#region Title Control
		//menu item selection
		if (keyboard_check_pressed(ord("X"))) {
			start = 1; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		#endregion
		break;
	case 1:
		#region Main Control
		if (keyboard_check_pressed(vk_anykey)) {
			//moving up and down
			if (keyboard_key == vk_up) 
				cursorPosition = clamp(cursorPosition - 1,0,2);
			else if (keyboard_key == vk_down) {
				cursorPosition = clamp(cursorPosition + 1,0,2);
			}
		}
		//menu item selection
		if (keyboard_check_pressed(ord("Z"))) {
			start = 0; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		if (keyboard_check_pressed(ord("X"))) {
			switch (cursorPosition) {
				case 0: //classic
				case 1: //practice
					start = 2; flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
				case 2: //options
					break;
			}
		}
		#endregion
		break;
	case 2:
	case 3:
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}