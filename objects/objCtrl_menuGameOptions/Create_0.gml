event_inherited();

if (instance_exists(objCtrl_gameSession)) instance_destroy(objCtrl_gameSession);
ui = instance_create_layer(x,y,"GUI",objUI_menuGameOptions);

// init character portait
instance_create_layer(x,y,"GUI",objCtrl_characterPortrait);
if (global.gameMode == 0) objCtrl_characterPortrait.ui.visible = true;

//initialize global variables for game setup
if (global.gameMode == 1) global.character = 0;
else global.character = 1
global.maxLevel = 1000;
global.gameLevel = 0;	
global.startGameLevel = 0;
global.maxChar = 3;

// Controls delay on level picking
delay = 0.05;
delayTime = current_time;
keyPressLength = 0;
longPress = 20;
lastKey = -1;
