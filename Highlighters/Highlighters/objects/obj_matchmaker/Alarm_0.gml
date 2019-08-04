if (ds_list_size(final) >= matchSize) {
	//initializes match animation
	if !(animating) {
		final = scr_matchListSort(final,0,ds_list_size(final) - 1);
		animating = true;
		flicker = true;
		global.freeze = true;
		alarm[0] = flickerDelay;
	}
	
	//controls flickering
	if (flicker) {
		//flickers until delay is reached
		if (++flickerCount < whiteDelay) {
			postWhite = true;
			if (flickerCount % 2 == 0) { 
				for (var i = 0; i < ds_list_size(final); i++) {
					var entity = ds_list_find_value(final,i);
					entity.image_index = entity.index;
				}
			} else {
				for (var i = 0; i < ds_list_size(final); i++) {
					var entity = ds_list_find_value(final,i);
					entity.image_index = entity.index + 5;
				}
			}
			alarm[0] = flickerDelay
		} else { //if delay is reached, switch to 3rd frame of animation
			if (postWhite) {
				for (var i = 0; i < ds_list_size(final); i++) {
					var entity = ds_list_find_value(final,i);
					entity.image_index = entity.index + 4;
				}
				alarm[0] = postWhiteDelay;
				postWhite = false;
			}
		}
		
		//controls highlighting animation
		if !(postWhite) {
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
}
else {
	origin.matchmaker = noone;
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i)
		entity.match = false; 
	}	
	instance_destroy();
}