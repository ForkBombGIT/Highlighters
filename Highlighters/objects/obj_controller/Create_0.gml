randomize();
layer_background_blend(layer_get_id("Background"), $908fff);
//holds gameover state
gameover = false;

//used for placing pieces
boardWidth = 6;
boardHeight = 9;
startingRows = 5;
newRow = false;

//controls game loop
blockPrevTime = current_time;
bombPrevTime = current_time;
blockPace = 10;
bombPace = 3;
newRow = false;
highest = 0;

//game score
gameScore = 0;

//game speed
gameSpeed = 0;

//next bomb
nextBomb = irandom_range(0,12);

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
			var gamePiece = instance_create_layer(scr_getColPos(col),
												  scr_getRowPos(tRow),
												  "Instances",
												  obj_piece);	
		
			gamePiece.col = col;
			gamePiece.row = tRow;
		}
	}
}