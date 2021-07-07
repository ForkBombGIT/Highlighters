event_inherited();

// Create the UI associated with the control
if (instance_exists(objCtrl_gameSession)) instance_destroy(objCtrl_gameSession);
ui = instance_create_layer(x,y,"GUI",objUI_menuGameOptions);

// Create character portrait
instance_create_layer(x,y,"GUI",objCtrl_characterPortrait);
// The portrait initializes as invisible, as it's not needed during practice mode
// (will probably change with updated character select)
if (global.gameMode == 0) objCtrl_characterPortrait.ui.visible = true;

//initialize global variables for game setup
if (global.gameMode == 1) global.character = 0;
else global.character = 1
global.maxLevel = 1000;
global.gameLevel = 0;	
global.startGameLevel = 0;
global.maxChar = 4;

// Controls delay on level picking
delay = 45;
delayTime = current_time;
keyPressLength = 0;
longPress = 20;
lastKey = -1;