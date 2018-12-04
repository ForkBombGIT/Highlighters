event_inherited();

//falls until reaching a block
if ((!place_meeting(x,scr_getRowPos(row - 1), par_entity)) && ((row - 1) > 0)){
	if (((current_time - timer)/1000) > obj_controller.fallPace){
		y = scr_getRowPos(--row);
		timer = current_time;
	}
} 
else {
	//var tempArr = [];
	//tempArr[col] = self;
	//if (row >= ds_list_size(obj_controller.gameEntities)) ds_list_add(obj_controller.gameEntities,tempArr);
	//else {
	//	var currRow = ds_list_find_value(obj_controller.gameEntities,row)
	//	currRow[@col] = self;
	//}
}