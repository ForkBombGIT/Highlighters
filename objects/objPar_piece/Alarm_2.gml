if (highlightIndex < highlightLength) {
	image_index = index + (highlightIndex++);
	alarm[2] = ((global.fastAnim || highlightIndex >= 5)) ? highlightDelay * 2 : highlightDelay;
} else {
	visible = false;
	highlighting = 2;
}