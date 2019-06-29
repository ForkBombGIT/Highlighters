show_debug_message("len" + string(ds_list_size(final)));
show_debug_message("num" + string(instance_number(obj_matchmaker)));
if (ds_list_size(final) >= matchSize) {
	if !(animating) {
		for (var i = 0; i < ds_list_size(final); i++) {
			var entity = ds_list_find_value(final,i);
			entity.image_index = entity.index + 8;
		}
		animating = true;
		alarm[0] = highlightDelay;
	}
	else {
		if (listPosition > ds_list_size(final) - 1) {
			show_debug_message("scr");
			for (var i = 0; i < ds_list_size(final); i++) {
				instance_destroy(ds_list_find_value(final,i));	
			}
			obj_controller.gameScore += (ds_list_size(final) * baseScoreInc) + ((ds_list_size(final) - matchSize) * additionalScoreInc);
			instance_destroy();
		}
		else {
			show_debug_message("icr" + string(listPosition));
			var entity = ds_list_find_value(final,listPosition);
			entity.image_index = entity.index + 7;
			alarm[0] = highlightDelay;
			listPosition++;
		}
		
	}
}
//else {
//	for (var i = 0; i < ds_list_size(final); i++) {
//		var entity = ds_list_find_value(final,i)
//		entity.match = false; 
//	}	
//	show_debug_message("destroy");
//	instance_destroy();
//}