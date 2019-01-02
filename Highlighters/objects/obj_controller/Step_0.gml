 #region Game Loop
//block loop
if (((current_time - blockPrevTime)/1000) > blockPace){
	for (var i = 0; i < boardWidth; i++){
		scr_createEntity(0,i,obj_piece);	
	}
	newRow = true;
	blockPrevTime = current_time;
} else newRow = false;

//bomb loop
if (((current_time - bombPrevTime)/1000) > bombPace){
	var pieceCol = irandom_range(0,boardWidth - 1);
	if (!scr_getPieceAtPos(8,pieceCol)) {
		var gamePiece = scr_createEntity(8,pieceCol,obj_bomb);	
		gamePiece.image_index = nextBomb;
		nextBomb = irandom_range(0,12);
	} else gameover = true;
	bombPrevTime = current_time;
}
#endregion
