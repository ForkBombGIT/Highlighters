var row = argument0;

for (var i = 0; i < obj_controller.boardWidth; i++) 
	if (instance_exists(scr_getPieceAtPos(row,i))) return true;	
return false;