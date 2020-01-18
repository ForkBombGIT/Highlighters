var key = argument0;
if (key == ds_map_find_value(global.controls,"LEFT")) {
		if (col > 0){
			col -= 1;
		}
}
if (key == ds_map_find_value(global.controls,"RIGHT")) {
	if (col < obj_controller.boardWidth - 2){
		col += 1;
	}
}
if (key == ds_map_find_value(global.controls,"UP")) {
	if (y - spr_charm.sprite_height >= scr_getRowPos(8)){
		y -= spr_charm.sprite_height;
		row --;
	}
}
if (key == ds_map_find_value(global.controls,"DOWN")) {
	if (y + spr_charm.sprite_height <= scr_getRowPos(0)){
		y += spr_charm.sprite_height;
		row ++;
	}
}