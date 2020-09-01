if (highlightIndex < highlightLength) {
	image_index = index + (highlightIndex++);
	alarm[2] = ((global.fastAnim || highlightIndex >= 5)) ? highlightDelay * 3 : highlightDelay * 2;
} else {
	visible = false;
	highlighting = 2;
}