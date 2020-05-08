//holds the exit state of the game
endState = -1;

//controls flicker
flash = false;

//gameover menu
endCursor = 0;
endOptionAnim = 0;
gameoverAnim = 0;
stopGameoverAnim = false;

//animation speeds (in fps)
optionSpeed = 12;
gameoverSpeed = 30;

//restart
restart = false;

//board sprites
boards = [spr_boardp,spr_board1, spr_board2];
board = obj_controller.board;

if (instance_exists(obj_controller))
	instance_destroy(obj_controller);