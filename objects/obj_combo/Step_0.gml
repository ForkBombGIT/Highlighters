event_inherited();

if (comboSize != -1) {
	if (visible == false) {
		if (comboSize > maxCombo) comboSize = maxCombo + 1;
		image_index = comboSize * animLength;
	}
	visible = true;
	endAnim = (image_index > (comboSize * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
}
