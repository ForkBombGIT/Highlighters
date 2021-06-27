function scr_checkRow(argument0) {
	var row = argument0;

	for (var i = 0; i < objCtrl_gameSession.boardWidth; i++) {
		var piece = scr_getPieceAtPos(row,i);
		if (instance_exists(piece) && (piece.bottomEntity) && 
		   (piece.y <= scr_getRowPos(row) || 
		   instance_exists(scr_getPieceAtPos(clamp(row + 1,0,objCtrl_gameSession.boardHeight), i)))) 
			return true;	
	}
	return false;
}
