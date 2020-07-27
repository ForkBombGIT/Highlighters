highlightIndex += (global.fastAnim || matchNumber >= 5) //to-do globalize combosize
if (++highlightIndex < highlightLength) {
	image_index = index + highlightIndex;
	alarm[2] = highlightDelay;
} else {
	visible = false;
	highlighting = 2;
}