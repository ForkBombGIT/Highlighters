var notSwapping = true;
var pieceBelow = instance_place(x, y + global.pieceSize, par_entity);
if (instance_exists(pieceBelow) && (pieceBelow.swap))
	notSwapping = false;
if (!(bottomEntity) && !(swap) && (notSwapping)) {
	if (!instance_exists(instance_position(x,y + global.pieceSize,par_entity))) {
		y += global.pieceSize;	
		falling = true;
		bounce = false;
		alarm[0] = fallDelay;
	} 
}	