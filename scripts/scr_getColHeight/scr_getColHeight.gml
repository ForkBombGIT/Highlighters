function scr_getColHeight(col){
	var currentHeight = objCtrl_gameSession.boardHeight;
	while (currentHeight >= 0) && (col != -1) {
		var pieceAtPos = scr_getPieceAtPos(currentHeight,col);
		if (instance_exists(pieceAtPos))
			return currentHeight;
		currentHeight--;
	}
	return 0;
}