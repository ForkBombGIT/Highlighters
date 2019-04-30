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
	#region Menu Drawing
	//draw_sprite(spr_grid,0,0,0);
	draw_sprite(spr_mainmenu,0,48,24);
	draw_sprite(spr_oneplayer,(startCursor == 0) ? round(textImageIndex) : 0,48,312);
	draw_sprite(spr_options,(startCursor == 1) ? round(textImageIndex) : 0,289,312);
	draw_sprite(spr_quit,(startCursor == 2) ? round(textImageIndex) : 0,528,312);
	draw_sprite(spr_ok,18,48,72);
	draw_sprite(spr_back,0,144,72);
	#endregion
}
else if (start == 3) {
	#region Menu Drawing
	draw_sprite(spr_startcursor,round(cursorImageIndex),72,cursorPositions[cursor]);
	draw_sprite(spr_tutorial,(cursor == 0) ? round(textImageIndex) : 0,117,69);
	draw_sprite(spr_endless,(cursor == 1) ? round(textImageIndex) : 0,117,117);
	draw_sprite(spr_timetrial,(cursor == 2) ? round(textImageIndex) : 0,117,165);
	draw_sprite(spr_ok,18,552,384);
	draw_sprite(spr_back,0,648,384);
	#endregion
}

if (flash) draw_rectangle(0,0,768,432,c_black);