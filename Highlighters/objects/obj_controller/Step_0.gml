#region Game Loop
if (((current_time - prevTime)/1000) > blockPace){
	if (ds_list_size(gameEntities) < 12){
		var pieceRow, gamePiece;
		for (var i = 0; i < boardWidth; i++){
			gamePiece = instance_create_layer((sprite_get_width(spr_piece) * i) + 32,
											   window_get_height() - sprite_get_width(spr_piece),
											   "Instances",
											   obj_piece);	
										  
			pieceRow[i] = gamePiece.id;
		}
		
		ds_list_add(gameEntities,pieceRow);
	
		newRow = true;
		prevTime = current_time;
	}
} else newRow = false;
#endregion