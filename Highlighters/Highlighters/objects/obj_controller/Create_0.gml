randomize();
//holds key settings
keyA = "S"
keyB = "A"

//holds gameover state
global.gameover = false;
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
global.orgRiseSpeed = 3;
global.riseSpeed = global.orgRiseSpeed;
global.riseUp = false;
startingRows = 5;
selectedEntities = obj_startGame.selectedEntites;
instance_destroy(obj_startGame);

//controls game loop 
risePace = 1.5;
riseTimer = current_time;

//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Instances",obj_cursor);		
cursor.visible = false;
gui = instance_create_layer(x,y,"Controller",obj_gui);

scr_initRows();