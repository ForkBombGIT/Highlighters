randomize();
//contains all game pieces
gameEntities = ds_list_create();
for (var i = 0; i < 12; i++){
	ds_list_add(gameEntities,[]);
}

//used for placing pieces
boardWidth = 6;
boardHeight = 12;
newRow = false;
sideBarOffsetX = 264;

//controls game loop
blockPrevTime = current_time;
bombPrevTime = current_time;
blockPace = 4;
bombPace = 2;
fallPace = 1;

var pieceWidth = sprite_get_width(spr_piece);
cursor = instance_create_layer((sideBarOffsetX) + ((pieceWidth - 1) * (boardWidth / 2) - (pieceWidth / 2)),
							  ((sprite_get_height(spr_piece) * ((boardHeight) / 2)) + pieceWidth), 
							    "Instances", 
							    obj_cursor);
								