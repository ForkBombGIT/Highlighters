if (comboSize != 0) {
	if (visible == false) {
		image_index = ((comboSize - minComboSize > sprite_get_number(spr_combo)) ? 
					  (sprite_get_number(spr_combo) - animLength) : (comboSize - minComboSize)) * 
					  animLength;
	}
	visible = true;
	endAnim = (image_index > ((comboSize - minComboSize) * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
}