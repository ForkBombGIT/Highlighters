y = scr_getRowPos(row);

//move row up
if (((current_time - timer) / 1000) > obj_controller.bombPace) {
	if (obj_controller.newRow)
		if ((position_meeting(scr_getColPos(col),scr_getRowPos(row - 1),par_entity)) || (row == 0)) row++;
}

#region Swap control
if (swap){
	//checks if there is a col value stored in targetX, 
	//if there is, assign it the x position of the col
	if (targetX < obj_controller.boardWidth) {
		col = targetX;
		targetX = scr_getColPos(targetX);
	}
	
	//increment until position is reached
	if (x < targetX) x += swapSpeed;
	else if (x > targetX) x -= swapSpeed;
	else { x = targetX; swap = false; }
}
#endregion

#region Fall Control
if (((current_time - dropTimer) / 1000) > obj_controller.fallPace){
	if (!(obj_controller.newRow)){
		if (!(position_meeting(scr_getColPos(col),scr_getRowPos(row - 1),par_entity))){
			if (row - 1 > 0) row--; 
		} 
	}
	dropTimer = current_time;
}
#endregion