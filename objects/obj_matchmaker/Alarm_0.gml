if !(global.gameover) || 
   !(global.victory) {
	if (ds_list_size(final) >= matchSize) {
		//initializes match animation
		if !(animating) {
			//sorts
			final = scr_matchListSort(final,0,ds_list_size(final) - 1);
			animating = true;
			flicker = true;
			alarm[0] = flickerOffset;
		}
	
		//controls flickering
		if (flicker) {
			//flickers until delay is reached
			if (flickerCount++ < flickerDelay) {
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
			} else { flicker = false; postFlicker = true; }
			alarm[0] = flickerOffset
		} else {//if delay is reached, switch to 3rd frame of animation
			if (postFlicker) {
				for (var i = 0; i < ds_list_size(final); i++) {
					var entity = ds_list_find_value(final,i);
					entity.match = true;
					entity.image_index = entity.index + 7;
				}
				alarm[0] = postFlickerDelay;
				postFlicker = false;
				highlight = true;
		
			}
			//controls highlighting animation
			if (highlight) {
				if (listPosition <= ds_list_size(final) - 1) {
					var entity = ds_list_find_value(final,listPosition);
					if (instance_exists(entity)) {
						if !(entity.highlighting) {
							entity.highlight = true;
							entity.matchNumber = listPosition + 1;
						}
						else if (entity.highlighting == 2) 
							listPosition++;
					}
					alarm[0] = (global.fastAnim) ? fastHighlightDelay : highlightDelay;
				}
				else {	
					for (var i = 0; i < ds_list_size(final); i++) {
						var entity = ds_list_find_value(final,i);
						instance_destroy(entity);
					}
					global.gameScore = min(global.gameScore + (ds_list_size(final) * baseScoreInc) + (comboSize * comboBonus),
										   global.victoryScore);
					if !(global.practice) {
						//checks if level is at x99, if it is, follow normal combo behavior
						if (global.gameLevel % global.levelToMatch == global.levelToMatch - 1)
							global.gameLevel = global.gameLevel + (comboSize > 0) + 1
						//otherwise 
						else global.gameLevel = min(global.gameLevel + (comboSize > 0) + 1,
												   (floor((global.gameLevel / global.levelToMatch) % 10) * global.levelToMatch) + global.levelToMatch - 1);
						global.gameLevel = min(global.gameLevel, global.maxLevel - 1);
					}
					instance_destroy();
				}		
			}	
		}
	} else {
		instance_destroy();	
	}
}