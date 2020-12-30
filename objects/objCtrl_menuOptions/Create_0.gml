event_inherited();
transitioning = false;
nextState = 0;
ui = instance_create_layer(x,y,"GUI",objUI_menuOptions);

inputPrompt = -1;
promptTime = current_time;
promptLife = 3;
inputChangeKey = false;
inputMaxCursorPosition = 10;
avMaxCursorPosition = 8;
exitState = 0;

// Controls delay on level picking
delay = 0.05;
delayTime = current_time;
keyPressLength = 0;
longPress = 20;
lastKey = -1;

confirmResolution = false;
fullscreenOption = ds_map_find_value(ds_map_find_value(global.options,"av"),"fullscreen");
resolutionOption = ds_map_find_value(ds_map_find_value(global.options,"av"),"resolution");