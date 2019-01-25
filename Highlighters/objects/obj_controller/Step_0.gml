 #region Game Loop
highest = scr_getHeight();

//block loop
if (!instance_exists(obj_countdown) && !(global.gameover)){
	if (highest < boardHeight) {
		if (obj_gui.seconds >= blockCount){
			blockCount += blockPace;
			for (var i = 0; i < boardWidth; i++){
				scr_createEntity(-1,i,obj_piece);	
			}
			newRow = true;
			rowUp = true;
		} else newRow = false;
	} else global.gameover = true;
	
	//bomb loop
	if (obj_gui.seconds >= bombCount){
		bombCount = obj_gui.seconds + bombPace;
		var pieceCol = irandom_range(0,boardWidth - 1);
		if (!scr_getPieceAtPos(8,pieceCol)) {
			var gamePiece = scr_createEntity(8,pieceCol,obj_bomb);	
			gamePiece.image_index = nextBomb;
			gamePiece.index = nextBomb;
			nextBomb = selectedEntities[irandom_range(0,array_length_1d(selectedEntities) - 1)] * 10;
		} else global.gameover = true;
	}
}
//handles gameover logic
if (global.gameover) {
	if !(anim) { anim = true; alarm[0] = 5; }
}
#endregion

#region Game Speed
if (blocksMatched > 90)         gameSpeed = 9;
else if (blocksMatched > 80)	gameSpeed = 8;
else if (blocksMatched > 70)	gameSpeed = 7;
else if (blocksMatched > 60)	gameSpeed = 6;
else if (blocksMatched > 50)	gameSpeed = 5;
else if (blocksMatched > 40)	gameSpeed = 4;
else if (blocksMatched > 30)	gameSpeed = 3;
else if (blocksMatched > 20)	gameSpeed = 2;
else if (blocksMatched > 10)	gameSpeed = 1;
else gameSpeed = 0;

blockPace = maxBlockPace - (blockPaceDecrement * gameSpeed);
bombPace = maxBombPace - gameSpeed;
#endregion
