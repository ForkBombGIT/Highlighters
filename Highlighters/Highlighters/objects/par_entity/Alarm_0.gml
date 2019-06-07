if (!(bottomEntity) && !(swap)) {
	var entity = scr_collision_line_first(x,y,x,view_hport[0],par_entity,0,1);
		y = instance_exists(entity) ? entity.y - sprite_height : 24;
		landAnim = true;
		landAnimIndex = index;
}	