 #region Game Loop
//block loop
if (((current_time - blockPrevTime)/1000) > blockPace){
	for (var i = 0; i < boardWidth; i++){
		var gamePiece = instance_create_layer(scr_getColPos(i),
											  scr_getRowPos(0),
											  "Instances",
											  obj_piece);	
		
		gamePiece.col = i;
	}
	newRow = true;
	blockPrevTime = current_time;
} else newRow = false;

//bomb loop
if (((current_time - bombPrevTime)/1000) > bombPace){
	var pieceCol = irandom_range(0,boardWidth - 1);
	if (!scr_getPieceAtPos(8,pieceCol)) {
		var gamePiece = instance_create_layer(scr_getColPos(pieceCol),
											  scr_getRowPos(8),
											  "Instances",
											  obj_bomb);	
											  
		gamePiece.col = pieceCol;
		gamePiece.image_index = nextBomb;
		nextBomb = irandom_range(0,12);
	} else gameover = true;
	bombPrevTime = current_time;
}
#endregion
