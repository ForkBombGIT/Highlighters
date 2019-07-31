if (instance_exists(obj_controller)) instance_destroy(obj_controller);
if (instance_exists(obj_startscreen)) instance_destroy(obj_startscreen);
//sets font to use
numFont = font_add_sprite_ext(spr_numbers, "0123456789:<>", true, 0); 

//blocks to be used for run
selectedEntites = scr_generateBlocks();

//whether or not to start game
start = 0;
flash = false;

//game settings
board = 0;
boards = [spr_board1];
characters = [spr_cognac];
level = 1;
track = 0;
char = 0;

//maximum values
maxLevel = 500;
maxTrack = 1;
maxChar = 1;
maxBoard = 1;

//cursor control
cursorPositions = [96,168,216,264,360];
cursor = 0;
image_speed = 0.033;