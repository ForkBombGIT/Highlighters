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

if (flash) draw_rectangle(0,0,768,432,c_black);