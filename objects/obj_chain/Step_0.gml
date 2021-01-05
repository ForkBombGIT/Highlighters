event_inherited();

if (chainSize != -1) {
	if (visible == false) {
		if (chainSize > maxChain) chainSize = maxChain + 1;
		image_index = chainSize * animLength;
	}
	visible = true;
	endAnim = (image_index > ((chainSize) * animLength) + (animLength - 1)); 
	if (endAnim) 
		image_speed = 0;
}