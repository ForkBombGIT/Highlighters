if (splash) {
	// skip screen
	var inputMap = ds_map_find_value(global.options,"input");
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"A"))) {
		splashIndex = floor(splashIndex) + 1;
	}
	var splashAnimation = 0.005;
	splashIndex += splashAnimation;
	// check for last frame in splash screen
	if (floor(splashIndex) >= sprite_get_number(spr_splash)) {
		splash = false;
		if !(alarm[0]) alarm[0] = 2;
	}
}