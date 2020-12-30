event_inherited();
ui.cursorPosition = cursorPosition;

#region Input Control
//advance to practice
var inputMap = ds_map_find_value(global.options,"input");
var avMap = ds_map_find_value(global.options,"av");
var soundVol = ds_map_find_value(avMap,"soundVol") / 100;
if (global.gameMode == 1) state = 1;
if (keyboard_check_pressed(ds_map_find_value(inputMap,"A")) && 
   (objCtrl_game.ui.transitionAlpha == 0)) {
	audio_play_sound(snd_ok,1,0);
	audio_sound_gain(snd_ok,soundVol,0);
	if (++cursorPosition == 2) {
		state = 1;
	}
}
else if (keyboard_check_pressed(ds_map_find_value(inputMap,"B"))) {
	audio_play_sound(snd_back,1,0);
	audio_sound_gain(snd_back,soundVol,0);
	if (--cursorPosition == -1) {
		state = -1;
	}
}

if (keyboard_check(vk_anykey)) {
	lastKey = keyboard_key;
	if (lastKey == keyboard_key) {
		if (++keyPressLength == 1) scr_gameMenuCursorMovement(cursorPosition,keyboard_key);
	} else keyPressLength = 0;
	
	if (keyPressLength > longPress) {
		if (keyPressLength > 0) {
			if ((current_time - delayTime) > delay){
				delayTime = current_time;
				scr_gameMenuCursorMovement(cursorPosition,keyboard_key);
			}
		} 
	}
} else keyPressLength = 0;
#endregion