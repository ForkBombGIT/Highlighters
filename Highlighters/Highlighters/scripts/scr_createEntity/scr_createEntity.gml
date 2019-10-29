var row = argument0;
var col = argument1;
var object = argument2;
var color = argument3;

var gamePiece = instance_create_layer(scr_getColPos(col),
									  scr_getRowPos(row),
									  "Entities",
									  object);	
		
gamePiece.col = col;
gamePiece.row = row;
gamePiece.bottomEntity = true;
gamePiece.index = color;
gamePiece.image_index = gamePiece.index;
return gamePiece;