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
miscMaxCursorPosition = 5;
exitState = 0;

// Controls delay on level picking
delay = 0.05;
delayTime = current_time;
keyPressLength = 0;
longPress = 20;
lastKey = -1;

testAudio = false;
musicTest = 0;
music = [sng_don_tut,sng_floss,sng_cognac,sng_hasen,sng_milo];
soundTest = 0;
sounds = [snd_back,snd_cleara,snd_clearb,snd_combo_chain,snd_countdowna,snd_countdownb,snd_drop,snd_lose,snd_move,snd_ok,snd_pausea,snd_pauseb,snd_swap,snd_win_no_transition];

confirmResolution = false;
fullscreenOption = ds_map_find_value(ds_map_find_value(global.options,"av"),"fullscreen");
resolutionOption = ds_map_find_value(ds_map_find_value(global.options,"av"),"resolution");