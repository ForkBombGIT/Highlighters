var row = argument0;

for (var i = 0; i < obj_controller.boardWidth; i++) 
	if (instance_exists(scr_getPieceAtPos(row,i))) 
		if (instance_exists(scr_getPieceAtPos(row,i))) 
				if (scr_getPieceAtPos(row,i).grounded) return true;
return false;