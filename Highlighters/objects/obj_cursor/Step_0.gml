#region Cursor Movement
if (keyboard_check(vk_anykey)){
	if ((((current_time - delayTime) / 1000) >= delay)){
		delayTime = current_time;
		switch (keyboard_key){
			case (ord("A")):
				if ((x - sprite_get_width(spr_piece)) > obj_controller.sideBarOffsetX){
					x -= sprite_get_width(spr_piece);
					col -= 1;
				}
				break;
			case (ord("D")):
				if ((x + sprite_get_width(spr_piece)) < window_get_width() - obj_controller.sideBarOffsetX){
					x += sprite_get_width(spr_piece);
					col += 1;
				}
				break;
			case (ord("W")):
				if (y - sprite_get_height(spr_piece) > sprite_get_height(spr_piece) / 2){
					y -= sprite_get_height(spr_piece);
					row += 1;
				}
				break;
			case (ord("S")):
				if (y + sprite_get_height(spr_piece) < window_get_height() - sprite_get_height(spr_piece)/2){
					y += sprite_get_height(spr_piece);
					row -= 1;
				}
				break;
		}
	}
}
#endregion
