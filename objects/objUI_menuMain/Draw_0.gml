//draw background and title for all screens
if (state != 3) && 
   (state != 5) {
	draw_sprite(spr_menu_bg,0,0,0);
	draw_sprite(spr_menu_title,0,0,0);
}

switch (state) {
	case 0:
		//title screen
		draw_sprite(spr_menu_enter,floor(startFlickerIndex),120,360);
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
