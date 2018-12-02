#region Game Loop
if (((current_time - prevTime)/1000) > blockPace){
	if (ds_list_size(gameEntities) < boardHeight){
		var pieceRow, gamePiece;
		for (var i = 0; i < boardWidth; i++){
			gamePiece = instance_create_layer((sprite_get_width(spr_piece) * i) + sideBarOffsetX,
											   window_get_height() - sprite_get_width(spr_piece),
											   "Instances",
											   obj_piece);	
										  
			pieceRow[i] = gamePiece;
		}
		
		ds_list_insert(gameEntities,0,pieceRow);
	
		newRow = true;
		prevTime = current_time;
	}
} else newRow = false;
#endregion

#region Piece Switching
if (keyboard_check_released(vk_space)){
	if (obj_cursor.row < ds_list_size(gameEntities)){
		var row = ds_list_find_value(gameEntities,obj_cursor.row);
		var temp = row[@obj_cursor.col];
	
		row[@obj_cursor.col] = row[@obj_cursor.col + 1];
		row[@obj_cursor.col + 1] = temp;
	
		temp = row[@obj_cursor.col].x;
		row[@obj_cursor.col].x = row[@obj_cursor.col + 1].x;
		row[@obj_cursor.col + 1].x = temp;	
	}
}
#endregion