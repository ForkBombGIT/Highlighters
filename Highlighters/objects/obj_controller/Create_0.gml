randomize();
layer_background_blend(layer_get_id("Background"), $908fff);
//used for placing pieces
boardWidth = 6;
boardHeight = 9;
newRow = false;
sideBarOffsetX = 264;
topOffset = 60;
bottomOffset = 30;

//controls game loop
blockPrevTime = current_time;
bombPrevTime = current_time;
blockPace = 15;
bombPace = 5;
newRow = false;

//game score
gameScore = 0;

//game speed
gameSpeed = 0;

//next bomb
nextBomb = irandom_range(0,12);

//for timer
offset = 0;

pieceWidth = sprite_get_width(spr_piece);
cursor = instance_create_layer((sideBarOffsetX) + ((pieceWidth - 1) * (boardWidth / 2) - (pieceWidth / 2)),
							  ((sprite_get_height(spr_piece) * ((boardHeight) / 2)) + pieceWidth), 
							    "Instances", 
							    obj_cursor);
								
gui = instance_create_layer(x,y,"Controller",obj_gui);