 #region Game Loop
//block loop
if (((current_time - blockPrevTime)/1000) > blockPace){
	var pieceRow, gamePiece;
	for (var i = 0; i < boardWidth; i++){
		gamePiece = instance_create_layer((pieceWidth * i) + sideBarOffsetX,
										   scr_getRowPos(0),
										   "Instances",
										   obj_piece);	
		gamePiece.col = i;
		pieceRow[i] = gamePiece;
		newRow = true;
	}
	blockPrevTime = current_time;
} else newRow = false;

//bomb loop
if (((current_time - bombPrevTime)/1000) > bombPace){
	var pieceCol = irandom_range(0,boardWidth - 1);
	var gamePiece = instance_create_layer(scr_getColPos(pieceCol),
										  scr_getRowPos(8),
										  "Instances",
										  obj_bomb);	
											  
	gamePiece.col = pieceCol;
	gamePiece.image_index = nextBomb;
	nextBomb = irandom_range(0,12);
	bombPrevTime = current_time;
}
#endregion
