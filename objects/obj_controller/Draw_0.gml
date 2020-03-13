if (flash) draw_rectangle(0,0,768,432,c_black);
show_debug_message(image_index);
show_debug_message(fadeToBlack);
if (fadeToBlack) && !(alarm[0]) {
	image_speed = 1;
} 

if !(fadeToBlack) || (image_index >= 15) {
	image_speed = 0;
	if (fadeToBlack && image_index >= 15) {
		if !(alarm[0]) alarm = 60;
		image_index = 15;
	}
	else {
		fadeToBlack = false;
		image_index = 0;
	}
}

if (fadeToBlack)
	draw_sprite(spr_fadeToBlack,image_index,24,0);
