randomize();
//holds gameover state
global.gameover = false;
highestRow = 5;
anim = false;
animRow = 8;
flash = false;

//selected character
char = 0;

//game score
gameScore = 0;

//game speed 
gameSpeed = obj_startGame.level;

//holds the amount of blocks matched
blocksMatched = 0;	
if (gameSpeed > 1) {
	if (gameSpeed > 10) blocksMatched = (20 * (gameSpeed - 9)) + 90;	
	else blocksMatched = 10 * (gameSpeed);	
}

//used for placing pieces
boardWidth = 6;
boardHeight = 9;
board = 0;
global.riseSpeed = 1;
startingRows = 5;
newRow = false;
selectedEntities = obj_startGame.selectedEntites;
instance_destroy(obj_startGame);

//controls game loop 
highest = 0;
risePace = 1.5;
riseTimer = current_time;

cursor = instance_create_layer(x,scr_getRowPos(4),"Instances",obj_cursor);		
cursor.visible = false;
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
			scr_createEntity(tRow,col,(irandom_range(0,20) > 2) ? obj_piece : obj_bomb);
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
				scr_createEntity(currRow,col,(irandom_range(0,20) > 2) ? obj_piece : obj_bomb);
			}
		}
	}
}