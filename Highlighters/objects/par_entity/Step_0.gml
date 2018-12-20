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
//checks if there is no piece below
if (!(position_meeting(scr_getColPos(col),scr_getRowPos(row - 1),par_entity))){
	//checks if the timer needs to be set
	if (dropTimer == -1) dropTimer = current_time;
	//checks if the time since it was detected that there is no block below 
	//is greater than fall pace
	if (((current_time - dropTimer) / 1000) > obj_controller.fallPace){
		//checks if at bottom, or if a new row is being added
		if ((row - 1 > 0) && (!(obj_controller.newRow))){
			row--; 
			dropTimer = -1;
		}
	}
} else dropTimer = -1;
#endregion