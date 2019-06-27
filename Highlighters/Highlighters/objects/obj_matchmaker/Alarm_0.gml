if (ds_list_size(final) >= matchSize) {
	animating = true;
	show_debug_message(listPosition);
	show_debug_message(ds_list_size(final));
	if (listPosition >= ds_list_size(final)) {
		for (var i = 0; i < ds_list_size(final); i++) {
			instance_destroy(ds_list_find_value(final,i));	
		}
		obj_controller.gameScore += (ds_list_size(final) * baseScoreInc) + ((ds_list_size(final) - matchSize) * additionalScoreInc);
		instance_destroy();
	} else {
		var entity = ds_list_find_value(final,listPosition);
		entity.image_index = entity.index + 7;
		listPosition++;
		alarm[0] = highlightDelay;
	}
}
else {
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i)
		entity.match = false;
	}	
	instance_destroy();
}