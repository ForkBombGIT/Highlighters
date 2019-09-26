#region Menu Animation
var cursorSpeed = .1;
if (cursorImageIndex < 4){
    cursorImageIndex += cursorSpeed;
} else cursorImageIndex = 0;

var textSpeed = .4;
if (textImageIndex <= 12){
    textImageIndex += textSpeed;
} else textImageIndex = 2;
#endregion

switch (start) {
	case 0:
		#region Menu Control
		//menu item selection
		if (keyboard_check_pressed(ord("X"))) {
			start = 1; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		#endregion
		break;
	case 1:
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}