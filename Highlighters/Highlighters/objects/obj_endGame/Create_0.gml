//controls flicker
flash = false;

//gameover menu
endCursor = 0;
endOptionAnim = 0;
gameoverAnim = 0;

//define a key from user settings
keyA = obj_controller.keyA;
keyB = obj_controller.keyB;
keySelect = obj_controller.keySelect;
keyUp = obj_controller.keyUp;
keyDown = obj_controller.keyDown;
startGameSpeed = obj_controller.startGameSpeed;
keyLeft =obj_controller. keyLeft;
keyRight = obj_controller.keyRight;
keyPause = obj_controller.keyPause;
keyOff = obj_controller.keyOff;
practice = obj_controller.practice;

//restart
restart = false;

//board sprites
boards = [spr_board1, spr_board2];
board = obj_controller.board;

if (instance_exists(obj_controller))
	instance_destroy(obj_controller);