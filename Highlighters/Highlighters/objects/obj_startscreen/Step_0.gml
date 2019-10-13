#region Menu Animation
var startFlicker = 0.033;
if (startFlickerIndex < 2){
    startFlickerIndex += startFlicker;
} else startFlickerIndex = 0;
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
		//menu item selection
		if (keyboard_check_pressed(ord("Z"))) {
			start = 0; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		if (keyboard_check_pressed(ord("X"))) {
			start = 2; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		#endregion
		break;
	case 2:
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}