var notSwapping = true;
var pieceBelow = instance_place(x, y + global.pieceSize, objPar_piece);
if (instance_exists(pieceBelow) && (pieceBelow.swap))
	notSwapping = false;
if (!(bottomEntity) && !(swap) && (notSwapping)) {
	if (!instance_exists(instance_position(x,y + global.pieceSize / 2,objPar_piece))) {
		if (ds_list_size(tail) < maxTailLength) && 
		   !instance_exists(instance_position(x,y - global.pieceSize,objPar_piece)) {
			ds_list_add(tail,sprite_index);	
		}
		if (fallHeight >= maxTailLength) 
			tailDrawLength = max(tailDrawLength - 1, 0);
		fallHeight += 1;
		y += global.pieceSize;	
		alarm[0] = fallDelay;
		falling = true;
		bounce = false;
		skipDelay = false;
	} 
}	