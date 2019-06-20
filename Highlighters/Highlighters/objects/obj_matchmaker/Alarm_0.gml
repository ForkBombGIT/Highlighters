if (ds_list_size(final) >= matchSize) {
	for (var i = 0; i < ds_list_size(final); i++) {
		instance_destroy(ds_list_find_value(final,i));	
	}
	obj_controller.gameScore += (ds_list_size(final) * 10) + ((ds_list_size(final) - 3) * 5);
	instance_destroy();
}
else {
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i)
		entity.match = false;
	}	
	instance_destroy();
}