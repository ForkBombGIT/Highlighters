#region Game Loop
//block loop
if (((current_time - blockPrevTime)/1000) > blockPace){
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
		blockPrevTime = current_time;
	}
} else newRow = false;

//bomb loop
if (((current_time - bombPrevTime)/1000) > bombPace){
	if (ds_list_size(gameEntities) < boardHeight){
		var pieceCol = irandom_range(0,boardWidth - 1)
		var gamePiece = instance_create_layer(scr_getColPos(pieceCol),
											  sprite_get_width(spr_piece),
											  "Instances",
											  obj_bomb);	
											  
		gamePiece.col = pieceCol;
		bombPrevTime = current_time;
	}
}
#endregion

#region Piece Switching
if (keyboard_check_released(vk_space)){
	if (obj_cursor.row < ds_list_size(gameEntities)){
		var row = ds_list_find_value(gameEntities,obj_cursor.row);
		var temp = row[@obj_cursor.col];
		//checks if the pieces are being swapped
		if !(row[@obj_cursor.col].swap && row[@obj_cursor.col+1].swap){
			//switches spots in array
			row[@obj_cursor.col] = row[@obj_cursor.col + 1];
			row[@obj_cursor.col + 1] = temp;
			
			//starts swap animation
			row[@obj_cursor.col].targetX = obj_cursor.col;
			row[@obj_cursor.col + 1].targetX = obj_cursor.col + 1;	
			row[@obj_cursor.col].swap = true; row[@obj_cursor.col + 1].swap = true;
		}
	}
}
#endregion