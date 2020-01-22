for (var i = 0; i < ds_list_size(final); i++) {
	var entity = ds_list_find_value(final,i);
	if (instance_exists(entity)) entity.match = false;
}