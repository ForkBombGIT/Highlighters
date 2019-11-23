randomize();
//disables level progression
practice = false;

//holds key settings
keyA = ord("X")
keyB = ord("Z")
keySelect = vk_enter;
keyUp = vk_up;
keyDown = vk_down;
keyLeft = vk_left;
keyRight = vk_right;
keyPause = vk_enter;
keyOff = vk_escape;

//holds gameover state
global.gameover = false;
anim = false;
animRow = 8;
flash = false;

//restarts game
global.restart = false;

//selected character
char = 0;
//game score
gameScore = 0;
//game speed 
startGameSpeed = 1;
gameSpeed = startGameSpeed;

//game rule variables
boardWidth = 6;
boardHeight = 9;
board = 0;
minRisePace = 0.05;
maxLevel = 100;

//controls game loop 
orgRisePace = 3.0;
risePace = orgRisePace;
riseTimer = current_time;
initialScoreToNextLevel = 100;
scoreToNextLevel = initialScoreToNextLevel;
startNextLevelScale = 1;
nextLevelScale = startNextLevelScale;
incrementScaler = 1.1;

//used for row generation 
freeze = false;
freezeTime = 0;
freezeTimer = current_time;
global.orgRiseSpeed = 3;
global.riseSpeed = global.orgRiseSpeed;
global.riseUp = false;
global.forceRise = false;
global.forceRiseSpeed = 3;
startingRows = 6;
selectedEntities = scr_generateColors();

activeMatches = ds_list_create();

//instantiate game objects
cursor = instance_create_layer(x,scr_getRowPos(4),"Entities",obj_cursor);		
cursor.visible = false;
instance_create_layer(x,y,"Controller",obj_gui);
matchmakerManager = instance_create_layer(x,y,"Controller",obj_matchmakerManager);

scr_initRows(0);