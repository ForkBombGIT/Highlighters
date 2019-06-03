for (var i = 0; i < ds_list_size(final); i++) {
	instance_destroy(ds_list_find_value(final,i));	
}
show_debug_message(ds_list_size(final))
obj_controller.gameScore += (ds_list_size(final) * 10) + ((ds_list_size(final) - 3) * 5);
instance_destroy();