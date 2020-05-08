//splash screen
if (splash) {
	if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
		splashIndex = floor(splashIndex) + 1;
	}
	var splashAnimation = 0.005;
	splashIndex += splashAnimation;
	if (floor(splashIndex) >= sprite_get_number(spr_splash)) {
		splash = false;
		flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
}