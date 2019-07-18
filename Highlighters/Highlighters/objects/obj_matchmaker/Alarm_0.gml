if (ds_list_size(final) >= matchSize) {
	if !(animating) {
		final = scr_matchListSort(final,0,ds_list_size(final) - 1);
		for (var i = 0; i < ds_list_size(final); i++) {
			var entity = ds_list_find_value(final,i);
			entity.image_index = entity.index + 5;
		}
		animating = true;
		alarm[0] = highlightDelay;
	}
	else {
		if (listPosition <= ds_list_size(final) - 1) {
			var entity = ds_list_find_value(final,listPosition);
			entity.image_index = entity.index + 7;
			listPosition++;
			alarm[0] = highlightDelay;
		}
		else {	
			for (var i = 0; i < ds_list_size(final); i++) {
				instance_destroy(ds_list_find_value(final,i));	
			}
			obj_controller.gameScore += (ds_list_size(final) * baseScoreInc) + ((ds_list_size(final) - matchSize) * additionalScoreInc);
			instance_destroy();
		}
	}
}
else {
	origin.matchmaker = noone;
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i)
		entity.match = false; 
	}	
	instance_destroy();
}