draw_set_alpha(alpha);
draw_set_color(c_black);
draw_rectangle(0,0,768,672,c_black);
draw_set_color(c_white);
draw_set_alpha(1);

if (start == 3) {
	draw_sprite(spr_countdown,image_index,window_get_width()/2,window_get_height()/4);
}