function scr_initRows(argument0) {
	//loops for amount of desired starting rows
	for (var row = -1; row < startingRows - 1; row++) {
		scr_createRow(row);
	}
}
