event_inherited();

//gameover menu
endOptionAnim = 0;
gameoverAnim = 0;
gameEndState = 0;
stopGameoverAnim = false;

//animation speeds (in fps)
optionSpeed = 12;
gameoverSpeed = 30;

//restart
restart = false;

if (instance_exists(objCtrl_gameSession))
	instance_destroy(objCtrl_gameSession);