if (obj_controller.newRow){
	if (((current_time - createTime) / 1000) > obj_controller.blockPace)
		y -= sprite_height;	
}

if (swap){
	//checks if there is a col value stored in targetX, 
	//if there is, assign it the x position of the col
	if (targetX < obj_controller.boardWidth) 
		targetX = scr_getColPos(targetX);
	
	//increment until position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; }
}