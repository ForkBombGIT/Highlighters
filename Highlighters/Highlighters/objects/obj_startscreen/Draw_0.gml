if (start < 2) {
	//checks if there has been a long enough delay since the last color change
	if ((current_time - colorTimer) / 1000 > colorDelay){
		transition = true;
	}
	//checks if transition boolean is true
	if (transition) {
		//increment until reaching the end of the animation
		if (colora < (coloraOrg + 15))
			colora ++;	
		else {
			//sets color a to color b
			colora = colorb * 16;
			//updates color a boundry variable
			coloraOrg = colora;
			//iterates until color b has a new color
			while (colorb == colorbLast) {
				colorb = irandom_range(0,10);
			}
			colorbLast = colorb;
			transition = false;
			colorTimer = current_time;	
		}
	}
	//draws start screen
	draw_sprite(spr_titleback,0,0,0);
	draw_sprite(spr_titlemid_b,colorb,window_get_width()/2,window_get_height()/2);
	draw_sprite(spr_titlemid_a,colora,window_get_width()/2,window_get_height()/2);
	draw_sprite(spr_titlefront,0,window_get_width()/2,window_get_height()/2);
}
else if (start == 2) {
	#region Cursor Movement
	if (keyboard_check_pressed(vk_down))
		if (cursor < 4) cursor ++;
	if (keyboard_check_pressed(vk_up))
		if (cursor > 0) cursor --;
	#endregion	
	
	#region Menu Control
	//back to main menu
	if (keyboard_check_pressed(ord("Z"))){ 
		start = 0; flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}	
	//menu item selection
	if (keyboard_check_pressed(ord("X"))) {
		if (cursor == 0) { 
			start = 3; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		} 
	}
	#endregion
	
	#region Menu Drawing
	draw_sprite(spr_startcursor,0,72,cursorPositions[cursor]);
	draw_sprite(spr_oneplayer,0,117,69);
	draw_sprite(spr_twoplayer,0,117,117);
	draw_sprite(spr_special,0,117,165);
	draw_sprite(spr_locked,0,117,213);
	draw_sprite(spr_options,0,117,261);
	draw_sprite(spr_ok,23,552,384);
	draw_sprite(spr_back,25,648,384);
	#endregion
}
else if (start == 3) {
	#region Cursor Movement
	if (keyboard_check_pressed(vk_down))
		if (cursor < 2) cursor ++;
	if (keyboard_check_pressed(vk_up))
		if (cursor > 0) cursor --;
	#endregion
	
	#region Menu Control
	if (keyboard_check_pressed(ord("Z"))){ 
		start = 2; flash = true;
		if !(alarm[0]) alarm[0] = 2;
	}
	//menu item selection
	if (keyboard_check_pressed(ord("X"))) {
		if (cursor == 1) { 
			start = 4; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		} 
	}
	#endregion
	
	#region Menu Drawing
	draw_sprite(spr_startcursor,0,72,cursorPositions[cursor]);
	draw_sprite(spr_tutorial,0,117,69);
	draw_sprite(spr_endless,0,117,117);
	draw_sprite(spr_timetrial,0,117,165);
	draw_sprite(spr_ok,23,552,384);
	draw_sprite(spr_back,25,648,384);
	#endregion
}

if (flash) draw_rectangle(0,0,768,432,c_black);