randomize();
layer_background_blend(layer_get_id("Background"), $908fff);

//holds gameover state
gameover = false;

//used for placing pieces
boardWidth = 6;
boardHeight = 9;
startingRows = 5;
newRow = false;
selectedEntities = obj_start.selectedEntities;

//controls game loop
blockPrevTime = current_time;
bombPrevTime = current_time;
maxBlockPace = 30;
blockPace = maxBlockPace;
blockPaceDecrement = 2;
maxBombPace = 11;
bombPace = maxBombPace;
newRow = false;
highest = 0;

//holds the amount of blocks matched
blocksMatched = 0;

//game score
gameScore = 0;

//game speed
gameSpeed = 1;

//next bomb
nextBomb = selectedEntities[irandom_range(0,array_length_1d(selectedEntities) - 1)] * 8;

//for timer
offset = 0;

pieceWidth = sprite_get_width(spr_piece);
cursor = instance_create_layer(x,y,"Instances",obj_cursor);							
gui = instance_create_layer(x,y,"Controller",obj_gui);

//initializes blocks
//loops five times for five starting rows
for (var currRow = 0; currRow < startingRows; currRow++){
	for (var col = 0; col < boardWidth; col++){
		if (irandom_range(0,10) > 3) { 
			var tRow = currRow;
			//iterates until a block is found below a position
			//prevents blocks from falling at initialization
			while (tRow > 0) {
				if (!instance_exists(scr_getPieceAtPos(tRow - 1,col)))
					tRow -= 1;
				else break;
			}
			//creates piece
			scr_createEntity(tRow,col,obj_piece);
		}
	}
}

//ensures there are five rows, checks for empty rows
//and places tiles in viable positions
for (var currRow = 0; currRow < startingRows; currRow++){
	if (!scr_checkRow(currRow)) {	
		for (var col = 0; col < boardWidth; col++) {
			if (instance_exists(scr_getPieceAtPos(currRow - 1,col))) {
				//creates piece
				scr_createEntity(currRow,col,obj_piece);
			}
		}
	}
}