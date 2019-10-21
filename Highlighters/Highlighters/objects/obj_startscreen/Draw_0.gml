//draw background and title for all screens
draw_sprite(spr_menu_bg,image_index,0,0);
draw_sprite(spr_menu_title,image_index,0,0);
switch (start) {
	case 0:
		//title screen
		draw_sprite(spr_menu_enter,floor(startFlickerIndex),120,360);
		break;
	case 1:
		#region Menu Drawing
		draw_sprite(spr_menu_p1_classic,(cursorPosition == 0) ? floor(optionAnimationIndex) : 0,120,198);
		draw_sprite(spr_menu_p1_tutorial,(cursorPosition == 1) ? floor(optionAnimationIndex) : 0,120,246);
		draw_sprite(spr_menu_options_av,(cursorPosition == 2) ? floor(optionAnimationIndex) : 0,120,294);
		draw_sprite(spr_demo,0,100,360);
		#endregion
}
if (flash) draw_rectangle(0,0,768,432,c_black);