numFont = font_add_sprite_ext(spr_numbers, "0123456789:<>", true, 1); 
//blocks to be used for run
selectedEntites = scr_generateBlocks();
//whether or not to start game
start = false;
flash = false;
//game settings
board = 0;
boards = [spr_board1,spr_board2,spr_board3];
level = 1;
track = 0;
char = 0;
//maximum values
maxLevel = 20;
maxTrack = 1;
maxChar = 1;
maxBoard = 2;

cursorPositions = [96,168,216,264,360];
cursor = 0;
image_speed = 0.033;