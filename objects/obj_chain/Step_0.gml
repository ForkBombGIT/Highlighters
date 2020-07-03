if (chainSize != -1) {
	if (visible == false) {
		image_index = ((chainSize > sprite_get_number(spr_combo) / animLength) ? 
					  (sprite_get_number(spr_combo) - animLength) : 
					  (chainSize)) * animLength;
	}
	visible = true;
	endAnim = (image_index > ((chainSize) * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
}

if (global.restart)  ||
   (global.victory) {
	instance_destroy();	
}