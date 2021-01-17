var inputMap = ds_map_find_value(global.options,"input");
var avMap = ds_map_find_value(global.options,"av");
if (state != -1) {
	draw_sprite(spr_options_menus,state,0,0);
	if (inputPrompt >= 0) {
		draw_sprite(spr_input_prompt,inputPrompt,24,336);	
	}
}
switch (state) {
	//input menu
	case 0:
		//player
		if (cursorPosition == 0) draw_sprite(spr_options_inputs,0,24,72);
		draw_sprite((cursorPosition == 0) ? spr_keys : spr_keys_faded,3,432,72);
		//device
		if (cursorPosition == 1) draw_sprite(spr_options_inputs,1,24,96);
		draw_sprite((cursorPosition == 1) ? spr_keys : spr_keys_faded,0,432,96);
		//up
		if (cursorPosition == 2) draw_sprite(spr_options_inputs,2,24,144);
		draw_sprite((cursorPosition == 2) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 2) ?76: scr_keyToIndex(ds_map_find_value(inputMap,"UP")),432,144);
		//down
		if (cursorPosition == 3) draw_sprite(spr_options_inputs,3,24,168);
		draw_sprite((cursorPosition == 3) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 3) ?76:scr_keyToIndex(ds_map_find_value(inputMap,"DOWN")),432,168);
		//left
		if (cursorPosition == 4) draw_sprite(spr_options_inputs,4,24,192);
		draw_sprite((cursorPosition == 4) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 4) ?76:scr_keyToIndex(ds_map_find_value(inputMap,"LEFT")),432,192);
		//right
		if (cursorPosition == 5) draw_sprite(spr_options_inputs,5,24,216);
		draw_sprite((cursorPosition == 5) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 5) ?76:scr_keyToIndex(ds_map_find_value(inputMap,"RIGHT")),432,216);
		//swap/ok
		if (cursorPosition == 6) draw_sprite(spr_options_inputs,6,24,240);
		draw_sprite((cursorPosition == 6) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 6) ?76:scr_keyToIndex(ds_map_find_value(inputMap,"A")),432,240);
		//rise/back
		if (cursorPosition == 7) draw_sprite(spr_options_inputs,7,24,264);
		draw_sprite((cursorPosition == 7) ? spr_keys : spr_keys_faded,inputChangeKey && (cursorPosition == 7) ?76:scr_keyToIndex(ds_map_find_value(inputMap,"B")),432,264);
		//pause/quit
		if (cursorPosition == 8) draw_sprite(spr_options_inputs,8,24,288);
		draw_sprite((cursorPosition == 8) ? spr_keys : spr_keys_faded, scr_keyToIndex(ds_map_find_value(inputMap,"PAUSE")),432,288);
		//reset
		if (cursorPosition == 9) draw_sprite(spr_options_inputs,9,24,384);
		break;
	//av menu
	case 1:
		//music vol
		if (cursorPosition == 0) draw_sprite(spr_av_inputs,0,24,72);
		draw_set_font((cursorPosition == 0) ? numFont : numFontFaded);
		draw_text(384,72,string_replace_all(string_format(ds_map_find_value(avMap,"musicVol"),3,0)," ", "0"));
		//music test
		if (cursorPosition == 1) draw_sprite(spr_av_inputs,1,24,96);
		draw_set_font((cursorPosition == 1) ? numFont : numFontFaded);
		draw_text(408,96,string_replace_all(string_format(musicTest,2,0)," ", "0"));
		//sound vol
		if (cursorPosition == 2) draw_sprite(spr_av_inputs,2,24,120);
		draw_set_font((cursorPosition == 2) ? numFont : numFontFaded);
		draw_text(384,120,string_replace_all(string_format(ds_map_find_value(avMap,"soundVol"),3,0)," ", "0"));
		//sound test
		if (cursorPosition == 3) draw_sprite(spr_av_inputs,3,24,144);
		draw_set_font((cursorPosition == 3) ? numFont : numFontFaded);
		draw_text(408,144,string_replace_all(string_format(soundTest,2,0)," ", "0"));
		//fullscreen toggle
		if (cursorPosition == 4) draw_sprite(spr_av_inputs,4,24,192);
		draw_sprite((cursorPosition == 4) ? spr_menu_options_etc : spr_menu_options_etc_faded,ds_map_find_value(avMap,"fullscreen"),264,192);
		//resolution settings
		if (cursorPosition == 5) draw_sprite(spr_av_inputs,5,24,216);
		draw_sprite((cursorPosition == 5) ? spr_menu_options_etc : spr_menu_options_etc_faded,ds_map_find_value(avMap,"resolution") + 2,264,216);
		if (cursorPosition == 6) draw_sprite(spr_av_inputs,6,24,240);
		if (cursorPosition == 7) draw_sprite(spr_av_inputs,7,24,384);
		break;
}