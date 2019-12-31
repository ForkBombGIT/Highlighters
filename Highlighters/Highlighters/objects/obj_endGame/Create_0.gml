//controls flicker
flash = false;

//gameover menu
endCursor = 0;
endOptionAnim = 0;
gameoverAnim = 0;

//restart
restart = false;

//board sprites
boards = [spr_board1, spr_board2];
board = obj_controller.board;

if (instance_exists(obj_controller))
	instance_destroy(obj_controller);