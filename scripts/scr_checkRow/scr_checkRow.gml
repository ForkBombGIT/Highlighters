var row = argument0;

for (var i = 0; i < global.boardWidth; i++) {
	var piece = scr_getPieceAtPos(row,i);
	if (instance_exists(piece) && (piece.bottomEntity)) 
		return true;	
}
return false;