//draw background and title for all screens
if (start == 3) 
	draw_sprite(spr_menu_options_bg,floor(optionBackgroundAnimationIndex),0,0);
else { 
	draw_sprite(spr_menu_bg,0,0,0);
	draw_sprite(spr_menu_title,0,0,0);
}
switch (start) {
	case 0:
		//title screen
		draw_sprite(spr_menu_enter,floor(startFlickerIndex),120,360);
		break;
	case 1:
		#region Menu Drawing
		draw_sprite(spr_menu_p1_classic,(cursorPosition == 0) ? floor(optionAnimationIndex) : 0,120,198);
		draw_sprite(spr_menu_p1_tutorial,(cursorPosition == 1) ? floor(optionAnimationIndex) : 0,120,246);
		draw_sprite(spr_menu_options,(cursorPosition == 2) ? floor(optionAnimationIndex) : 0,120,294);
		draw_sprite(spr_menu_footer,1,100,360);
		break;
		#endregion
	case 2: 
		draw_sprite(spr_menu_options_input,(cursorPosition == 0) ? floor(optionAnimationIndex) : 0,120,198);
		draw_sprite(spr_menu_options_av,(cursorPosition == 1) ? floor(optionAnimationIndex) : 0,120,246);
		draw_sprite(spr_menu_footer,0,100,360);
		break;
	case 3:
		draw_sprite((option == 0) ? spr_menu_input : spr_menu_av, 0,0,0);
		switch (option) {
			//input menu
			case 0:
				draw_sprite(spr_keys,0,288,48);
				draw_sprite(spr_menu_option_prompt,inputPrompt,24,408);
				break;
			//av menu
			case 1:
				draw_sprite(spr_keys,0,288,48);
				draw_sprite(spr_keys,0,288,96);
				draw_sprite(spr_keys,0,288,144);
				draw_sprite(spr_keys,0,288,288);
				break;
		}
		break;
}
if (flash) draw_rectangle(0,0,768,432,c_black);