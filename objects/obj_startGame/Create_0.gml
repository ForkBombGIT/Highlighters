if (instance_exists(obj_controller)) instance_destroy(obj_controller);
if (instance_exists(obj_startScreen)) instance_destroy(obj_startScreen);
//sets font to use
numFont = font_add_sprite_ext(spr_menunumbers, "0123456789", true, 3); 

//whether or not to start game
start = 0;
flash = false;

//game settings
board = 1; //starts at 1 too account for practice board
boards = [spr_boardp,spr_board1,spr_board2];
chars = [spr_floss,spr_cognac];
level = 1;	
char = 0;

//maximum values
maxLevel = 1000;
maxBoard = 2;

//cursor control
delayTime = current_time;
delay = 0.05;
keyPressLength = 0;
longPress = 20;
lastKey = -1;
cursorPositions = [168,288];
cursor = 0;
cursorFlickerIndex = 0;
cursorType = 0;
image_speed = 0.033;