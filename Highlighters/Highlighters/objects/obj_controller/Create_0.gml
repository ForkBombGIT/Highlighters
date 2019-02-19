randomize();
//holds gameover state
global.gameover = false;
highestRow = 5;
anim = false;
animRow = 8;
flash = false;

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
startingRows = 5;
newRow = false;
selectedEntities = obj_startGame.selectedEntites;
instance_destroy(obj_startGame);

//controls game loop
maxBlockPace = 25;
blockPace = maxBlockPace;
blockCount = maxBlockPace;
blockPaceDecrement = 22/20;
currentBomb = noone;
newRow = false;
rowUp = false;
highest = 0;
lastTimeBlock = 0;
lastTimeBomb = 0;
bombPace = 0.5;

//next bomb
nextBomb = selectedEntities[irandom_range(0,array_length_1d(selectedEntities) - 1)] * 10;

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