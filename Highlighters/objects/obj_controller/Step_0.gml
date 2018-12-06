#region Game Loop
//block loop
if (((current_time - blockPrevTime)/1000) > blockPace){
	var pieceRow, gamePiece;
	for (var i = 0; i < boardWidth; i++){
		gamePiece = instance_create_layer((sprite_get_width(spr_piece) * i) + sideBarOffsetX,
										   window_get_height() - sprite_get_width(spr_piece),
										   "Instances",
										   obj_piece);	
										  
		pieceRow[i] = gamePiece;
	}
	
	for (var i = boardHeight; i > 0; i--){
		var t = ds_list_find_value(gameEntities,i - 1);
		ds_list_set(gameEntities,i,ds_list_find_value(gameEntities,i - 1));	
	}
	
	ds_list_set(gameEntities,0,pieceRow);
	
	newRow = true;
	blockPrevTime = current_time;
} else newRow = false;

//bomb loop
//if (((current_time - bombPrevTime)/1000) > bombPace){
//	var pieceCol = irandom_range(0,boardWidth - 1)
//	var gamePiece = instance_create_layer(scr_getColPos(pieceCol),
//											sprite_get_width(spr_piece),
//											"Instances",
//											obj_bomb);	
											  
//	gamePiece.col = pieceCol;
//	bombPrevTime = current_time;
//}
#endregion

#region Piece Switching
if (keyboard_check_released(vk_space)){
	var row = ds_list_find_value(gameEntities,obj_cursor.row);
	var temp = row[@obj_cursor.col];
	//checks if the pieces are being swapped
	if (row[@obj_cursor.col] != undefined || row[@obj_cursor.col+1] != undefined){
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