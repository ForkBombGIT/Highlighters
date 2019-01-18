 #region Game Loop
//block loop
if (!instance_exists(obj_start)){
	if (((current_time - blockPrevTime)/1000) > blockPace){
		for (var i = 0; i < boardWidth; i++){
			scr_createEntity(-1,i,obj_piece);	
		}
		newRow = true;
		rowUp = true;
		blockPrevTime = current_time;
	} else newRow = false;

	//bomb loop
	if (((current_time - bombPrevTime)/1000) > bombPace){
		var pieceCol = irandom_range(0,boardWidth - 1);
		if (!scr_getPieceAtPos(8,pieceCol)) {
			var gamePiece = scr_createEntity(8,pieceCol,obj_bomb);	
			gamePiece.image_index = nextBomb;
			gamePiece.index = nextBomb;
			nextBomb = selectedEntities[irandom_range(0,array_length_1d(selectedEntities) - 1)] * 10;
		} else gameover = true;
		bombPrevTime = current_time;
	}
}
#endregion

#region Game Speed
if (blocksMatched > 90)         gameSpeed = 10;
else if (blocksMatched > 80)	gameSpeed = 9;
else if (blocksMatched > 70)	gameSpeed = 8;
else if (blocksMatched > 60)	gameSpeed = 7;
else if (blocksMatched > 50)	gameSpeed = 6;
else if (blocksMatched > 40)	gameSpeed = 5;
else if (blocksMatched > 30)	gameSpeed = 4;
else if (blocksMatched > 20)	gameSpeed = 3;
else if (blocksMatched > 10)	gameSpeed = 2;

blockPace = maxBlockPace - (blockPaceDecrement * gameSpeed);
bombPace = maxBombPace - gameSpeed;
#endregion
