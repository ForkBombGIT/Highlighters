if !(global.gameover) {
	if (ds_list_size(final) >= matchSize) {
		//initializes match animation
		if !(animating) {
			//sorts
			final = scr_matchListSort(final,0,ds_list_size(final) - 1);
			animating = true;
			flicker = true;
			alarm[0] = flickerDelay;
		}
	
		//controls flickering
		if (flicker) {
			//flickers until delay is reached
			if (flickerCount++ < whiteDelay) {
				if (flickerCount % 2 == 0) { 
					for (var i = 0; i < ds_list_size(final); i++) {
						var entity = ds_list_find_value(final,i);
						if (instance_exists(entity))
							entity.image_index = entity.index + 4;
					}
				} else {
					for (var i = 0; i < ds_list_size(final); i++) {
						var entity = ds_list_find_value(final,i);	
						if (instance_exists(entity))
							entity.image_index = entity.index + 5;
					}
				}
			} else { flicker = false; postWhite = true; }
			alarm[0] = flickerDelay
		} else {//if delay is reached, switch to 3rd frame of animation
			if (postWhite) {
				for (var i = 0; i < ds_list_size(final); i++) {
					var entity = ds_list_find_value(final,i);
					entity.match = true;
					entity.image_index = entity.index + 7;
				}
				alarm[0] = postWhiteDelay;
				postWhite = false;
			}
			//controls highlighting animation
			else {
				if (listPosition <= ds_list_size(final) - 1) {
					var entity = ds_list_find_value(final,listPosition);
					if (instance_exists(entity)) {
						if !(entity.highlighting) 
							entity.highlight = true;
						else if (entity.highlighting == 2) 
							listPosition++;
					}
					alarm[0] = highlightDelay;
				}
				else {	
					for (var i = 0; i < ds_list_size(final); i++) {
						var entity = ds_list_find_value(final,i);
						instance_destroy(entity);
					}
					obj_controller.gameScore += (ds_list_size(final) * baseScoreInc) + (comboSize * comboBonus);
					if (global.gameLevel < global.maxLevel)
						global.gameLevel += (comboSize > 0) + 1
					instance_destroy();
				}		
			}	
		}
	} else {
		instance_destroy();	
	}
}