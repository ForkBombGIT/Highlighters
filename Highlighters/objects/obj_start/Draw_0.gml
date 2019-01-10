if (start == 3) {
	//draws countdown
	draw_sprite(spr_countdown,image_index,window_get_width()/2,window_get_height()/4);
} 
if (start < 2) {
	//draws start screen
	draw_sprite(spr_titleback,0,0,0);
	draw_sprite(spr_titlemid_b,0,window_get_width()/2,window_get_height()/2);
	draw_sprite(spr_titlemid_a,0,window_get_width()/2,window_get_height()/2);
	draw_sprite(spr_titlefront,0,window_get_width()/2,window_get_height()/2);
}

//applies fade
draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0,0,768,672,c_black);
draw_set_color(c_white);
draw_set_alpha(1);
