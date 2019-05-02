for (var i = 0; i < ds_list_size(visited); i++) {
	instance_destroy(ds_list_find_value(visited,i));	
}
obj_controller.gameScore += (ds_list_size(visited) * 10) + ((ds_list_size(visited) - 3) * 5);
instance_destroy();