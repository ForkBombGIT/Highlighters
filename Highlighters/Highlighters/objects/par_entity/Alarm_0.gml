if (!(bottomEntity) && !(swap)) {
	y = scr_collision_line_first(x,y,x,view_hport[0],par_entity,0,1).y - sprite_height;
	landAnim = true;
	landAnimIndex = index;
}	