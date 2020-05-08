randomize();

//holds gameover state
global.gameover = false;
global.victory = false;
gameoverDelay = global.practice ? 180 : 150;
anim = false;
animRow = 8;
flash = false;

//restarts game
global.restart = false;

//selected character
char = 0;

//game score
global.gameScore = 0;
global.victoryScore = (global.practice) ? 9999 : 999999;

//game rule variables
global.boardWidth = 6;
global.boardHeight = 9;
global.maxLevel = 1000;
board = 0;
fadeToBlack = false;

//controls game loop 
orgriseSpeed = 90;
riseSpeed = orgriseSpeed;
riseTimer = current_time;
canRise = true;
newRowInc = false;
global.fastAnim = false;

//time freeze
freeze = false;
freezeTime = 0;
freezeTimer = current_time;

//used for row generation 
global.orgRiseSpeed = 3;
global.riseSpeed = global.orgRiseSpeed;
global.riseUp = false;
global.forceRise = false;
global.forceRiseSpeed = 3;
startingRows = 6;
selectedEntities = scr_generateColors();
activeMatches = ds_list_create();

//animations
bounce = false;
bounceIndex = 0;
bounceAnimationFirst = 0.25; //4 frames
bounceAnimationLast = 0.5; // 2 frames 

//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
cursor.visible = false;
instance_create_layer(x,y,"Controller",obj_gui);
matchmakerManager = instance_create_layer(x,y,"Controller",obj_matchmakerManager);

scr_initRows(0);