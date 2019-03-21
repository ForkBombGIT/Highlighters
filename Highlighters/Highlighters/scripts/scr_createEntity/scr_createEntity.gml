var row = argument0;
var col = argument1;
var object = argument2;

var gamePiece = instance_create_layer(scr_getColPos(col),
									  scr_getRowPos(row),
									  "Instances",
									  object);	
		
gamePiece.col = col;
gamePiece.row = row;
gamePiece.bottomEntity = true;
return gamePiece;