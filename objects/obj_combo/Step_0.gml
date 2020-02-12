if (comboSize != 0) {
	if (visible == false) {
		image_index = (comboSize - minComboSize) * animLength;
	}
	visible = true;
	endAnim = (image_index > ((comboSize - minComboSize) * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
	
	show_debug_message(image_index);
}