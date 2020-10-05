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