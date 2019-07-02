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

//game rule variables
boardWidth = 6;
boardHeight = 9;
board = 0;
maxRiseSpeed = 24;
maxLevel = 500;

//controls game loop 
risePace = 1.5;
riseTimer = current_time;
initialScoreToNextLevel = 100;
scoreToNextLevel = initialScoreToNextLevel;
nextLevelScale = 1;
incrementScaler = 1.1;

//used for row generation 
global.orgRiseSpeed = 1;
global.riseSpeed = global.orgRiseSpeed;
global.riseUp = false;
startingRows = 5;
selectedEntities = obj_startGame.selectedEntites;
instance_destroy(obj_startGame);


//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Instances",obj_cursor);		
cursor.visible = false;
gui = instance_create_layer(x,y,"Controller",obj_gui);

scr_initRows();