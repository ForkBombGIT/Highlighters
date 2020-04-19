randomize();

//holds gameover state
global.gameover = false;
gameoverDelay = global.practice ? 180 : 150;
anim = false;
animRow = 8;
flash = false;

//restarts game
global.restart = false;

//selected character
char = 0;

//game score
gameScore = 0;

//game rule variables
global.boardWidth = 6;
global.boardHeight = 9;
board = 0;
global.maxLevel = 1000;
fadeToBlack = false;
victoryScore = 999999;

//controls game loop 
orgriseSpeed = 90;
riseSpeed = orgriseSpeed;
riseTimer = current_time;
canRise = true;
newRowInc = false;

//used for row generation 
freeze = false;
freezeTime = 0;
freezeTimer = current_time;
global.orgRiseSpeed = 3;
global.riseSpeed = global.orgRiseSpeed;
global.riseUp = false;
global.forceRise = false;
global.forceRiseSpeed = 3;
bounce = false;
bounceIndex = 0;
startingRows = 6;
selectedEntities = scr_generateColors();
activeMatches = ds_list_create();

//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
cursor.visible = false;
instance_create_layer(x,y,"Controller",obj_gui);
matchmakerManager = instance_create_layer(x,y,"Controller",obj_matchmakerManager);

scr_initRows(0);