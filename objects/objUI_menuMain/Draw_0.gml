//draw background and title for all screens
if (state != 3) && 
   (state != 5) {
	draw_sprite(spr_menu_bg,0,0,0);
	draw_sprite(spr_menu_title,0,0,0);
}

switch (state) {
	case 0:
		//title screen
		draw_set_font(upperCase);
		if (drawStart) {
			var key = scr_keyIndexToString(scr_keyToIndex(ds_map_find_value(inputMap,"A")));
			draw_text(168 - ceil((string_length(key) * 24)/2),360,"PRESS " + key);
		}
		break;
	case 1:
		#region Menu Drawing
		draw_sprite(spr_menu_p1_classic,(cursorPosition == 0) ? floor(optionAnimationIndex) : 0,120,198);
		draw_sprite(spr_menu_p1_tutorial,(cursorPosition == 1) ? floor(optionAnimationIndex) : 0,120,246);
		draw_sprite(spr_menu_options,(cursorPosition == 2) ? floor(optionAnimationIndex) : 0,120,294);
		break;
		#endregion
	case 2: 
		draw_sprite(spr_menu_options_input,(cursorPosition == 0) ? floor(optionAnimationIndex) : 0,120,198);
		draw_sprite(spr_menu_options_av,(cursorPosition == 1) ? floor(optionAnimationIndex) : 0,120,246);
		draw_sprite(spr_menu_options_misc,(cursorPosition == 2) ? floor(optionAnimationIndex) : 0,120,294);
		break;
	case 4:
		draw_sprite(spr_practice_prompt,0,105,198);
	break;
}
