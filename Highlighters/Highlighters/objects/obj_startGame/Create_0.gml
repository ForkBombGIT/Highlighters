if (instance_exists(obj_controller)) instance_destroy(obj_controller);

//sets font to use
numFont = font_add_sprite_ext(spr_numbers, "0123456789:<>", true, 0); 

//blocks to be used for run
selectedEntites = scr_generateBlocks();

//whether or not to start game
start = false;
flash = false;

//game settings
board = 0;
boards = [spr_board2,spr_board1,spr_board3,spr_board4];
backgrounds = [spr_background2,spr_background1,spr_background3,spr_background4];
characters = [spr_floss];
level = 1;
track = 0;
char = 0;

//maximum values
maxLevel = 99;
maxTrack = 1;
maxChar = 1;
maxBoard = 3;

//cursor control
cursorPositions = [96,168,216,264,360];
cursor = 0;
image_speed = 0.033;