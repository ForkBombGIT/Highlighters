function scr_getTallestCol(){
	var tallest = -1;
	var tallestCol = -1;
	var sameCol = [];
	for (var i = 0; i < objCtrl_gameSession.boardWidth; i++) {
		var col = scr_getCol(i);
		var colSize = ds_list_size(col)
		if (colSize == tallest) {
			array_push(sameCol,i);	
		}
		if (colSize > tallest) {
			tallest = colSize;
			tallestCol = i;
			sameCol = [i]
		}
		ds_list_destroy(col);
	}
	return array_get(sameCol,irandom_range(0,array_length(sameCol) - 1));
}