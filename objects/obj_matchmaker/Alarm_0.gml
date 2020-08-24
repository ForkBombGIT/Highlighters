if !(global.gameover || global.victory) {
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
			} else {
				//controls highlighting animation
				if (highlight) {
					var fastAnim = listPosition > 3;
					if (listPosition <= ds_list_size(final) - 1) {
						var entity = ds_list_find_value(final,listPosition);
						if (instance_exists(entity)) {
							if !(entity.highlighting) {
								entity.highlight = true;
								entity.matchNumber = (listPosition++) + 1;
								var sound = (global.fastAnim) || fastAnim ? snd_clearb : snd_cleara;
								audio_play_sound(sound,1,0);
							}
						}
						alarm[0] = (global.fastAnim) || fastAnim ? fastHighlightDelay : highlightDelay;
					}
					else animationComplete = true;
				}	
			}
		}
	} 
} 