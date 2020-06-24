if (comboSize != -1) {
	if (visible == false) {
		image_index = ((comboSize > sprite_get_number(spr_combo) / animLength) ? 
					  (sprite_get_number(spr_combo) - animLength) : comboSize) * 
					  animLength;
	}
	visible = true;
	endAnim = (image_index > (comboSize * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
}

if (global.restart) {
	instance_destroy();	
}