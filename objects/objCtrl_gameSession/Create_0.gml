randomize();

objCtrl_characterPortrait.ui.visible = true;

//holds gameover state
global.gameover = false;
global.victory = false;
global.riseBrake = false;
gameEnd = false;
gameoverDelay = global.gameMode == 1 ? 180 : 150;

//restarts game
global.restart = false;

//game score
global.requiresCombo = false;
global.levelToMatch = 100;
global.gameScore = 0;
global.victoryScore = (global.gameMode == 1) ? 9999 : 999999;

//game rule variables
boardWidth = 6;
boardHeight = 9;

//controls game loop 
riseTimer = current_time;
canRise = true;
newRowInc = false;
global.fastAnim = false;
postFastAnim = 10;

//time freeze
global.freeze = false;
freezeTime = 0;
freezeTimer = current_time;

//used for row generation 
global.orgRiseSpeed = 90;
global.riseSpeed = global.orgRiseSpeed;
global.riseAmount = 3;
global.riseUp = false;
global.forceRise = false;
global.forceRiseSpeed = 3;
startingRows = 6;
selectedEntities = scr_generateColors();
activeMatches = ds_list_create();

//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
cursor.visible = false;
ui = instance_create_layer(x,y,"GUI",objUI_gameSession);
instance_create_layer(x,y,"Controllers",obj_matchmakerManager);
instance_create_layer(x,y,"Controllers",objCtrl_gameAnimation);
instance_create_layer(x,y,"Controllers",objCtrl_menuPause);
instance_create_layer(x,y,"Controllers",objCtrl_gameMusic);

//generate stars
if !(global.gameMode == 1) {
	starsGridSize = 12;
	starGridUnitSize = 24;
	scr_generateStars(starsGridSize,starGridUnitSize);
}

scr_initRows(0);
