event_inherited();
ui.cursorPosition = cursorPosition;
var inputMap = ds_map_find_value(global.options,"input");

if !(deactivate) {
	instance_deactivate_all(1);
	instance_activate_object(ui);
	deactivate = true;
}

if (ui.image_index >= sprite_get_number(spr_menu_quit) - 1) {
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"LEFT"))) {
		if (cursorPosition == 1)
			cursorPosition--;
	}
	if (keyboard_check_pressed(ds_map_find_value(inputMap,"RIGHT"))) {
		if (cursorPosition == 0)
			cursorPosition++;
	}
	if (keyboard_check_released(ds_map_find_value(inputMap,"A"))) {
		if (cursorPosition == 0) {
			game_end();
		}
		if (cursorPosition == 1) {
			audio_play_sound(snd_back,1,0);
			instance_destroy(self);
		}
	}
	if (keyboard_check_released(ds_map_find_value(inputMap,"B"))) {
		audio_play_sound(snd_back,1,0);
		if (cursorPosition == 1) {
			instance_destroy(self);
		}
		cursorPosition = 1;
	}
	if (keyboard_check_released(ds_map_find_value(inputMap,"PAUSE"))) {
		audio_play_sound(snd_back,1,0);
		instance_destroy(self);
	}
}