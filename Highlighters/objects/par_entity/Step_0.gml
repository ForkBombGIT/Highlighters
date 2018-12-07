y = scr_getRowPos(row);
//piece swapping
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

//piece falling
if (((row - 1) > 0) && ((current_time - timer) / 1000 > obj_controller.fallPace)){
	var arr = ds_list_find_value(obj_controller.gameEntities,row - 1);
	show_debug_message(array_length_1d(arr))
	if (array_length_1d(arr) > 0) {
		if (arr[@col] == undefined)
			row--;
	}
	else row--;
	timer = current_time;
}