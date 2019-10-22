if (instance_exists(obj_controller)) instance_destroy(obj_controller);
if (instance_exists(obj_startscreen)) instance_destroy(obj_startscreen);
//sets font to use
numFont = font_add_sprite_ext(spr_numbers, "0123456789:<>", true, 0); 

//blocks to be used for run
selectedEntites = scr_generateColors();

//whether or not to start game
start = 0;
flash = false;

//game settings
board = 0;
boards = [spr_board1,spr_board2];
level = 1;	
char = 0;

//maximum values
maxLevel = 100;
maxBoard = 1;

//cursor control
delayTime = current_time;
delay = 0.05;
keyPressLength = 0;
longPress = 20;
lastKey = -1;
cursorPositions = [168,288];
cursor = 0;
cursorFlickerIndex = 0;
image_speed = 0.033;