if (highlightIndex < highlightLength) {
	image_index = index + (highlightIndex++);
	alarm[2] = highlightDelay;
} else {
	visible = false;
	highlighting = 2;
}