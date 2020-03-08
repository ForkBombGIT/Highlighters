var activeMatchmakers = instance_number(obj_matchmaker);
if !(global.gameover) {
	if !(combo) { 
		if (activeMatchmakers > 1) {
			for (var i = 0; i < activeMatchmakers - 1; i++) {
				var matchmaker = instance_find(obj_matchmaker,i);
				var matchmakerPlus = instance_find(obj_matchmaker,i+1);
				var deletion = false;
				if (instance_exists(matchmaker)) {
					if (instance_exists(matchmakerPlus)) {
						//check if the matchmakers "colorIndex" (the color they are matching)
						//and ensure at least one of them is done their match route
						if ((matchmaker.colorIndex == matchmakerPlus.colorIndex) && 
							 matchmaker.animating || 
							 matchmakerPlus.animating) {
							for (var j = 0; j < ds_list_size(matchmaker.final); j++){
								//check if matchmakerPlus's origin in in matchmaker
								if (ds_list_find_value(matchmaker.final,j) == matchmakerPlus.origin) {
									matchmakerPlus.origin.matchOverride = true;
									matchmakerPlus.origin.match = false;
									//add missing pieces from matchmakerPlus into matchmaker
									for (var k = 0; k < ds_list_size(matchmakerPlus.final); k++) {
										if (ds_list_find_index(matchmaker.final,ds_list_find_value(matchmakerPlus.final,k)) == -1)
											ds_list_add(matchmaker.final,ds_list_find_value(matchmakerPlus.final,k))
									}
									instance_destroy(matchmakerPlus);
									deletion = true;
									break;
								}
							}
						}
					}
					if (deletion) break;
				}
			}
		}
		//find matchmaker in matchmakers list
		//combo handling
		for (var i = 0; i < activeMatchmakers; i++) {
			var matchmaker = instance_find(obj_matchmaker,i);
			if (instance_exists(matchmaker)) {
				if (matchmaker.animating) {
					var val = ds_list_find_index(matchmakers,matchmaker)
					//if exists, remove it from active matchmakers list
					if (val != -1) ds_list_delete(matchmakers,val);
					//otherwise
					else {
						//if it has never been seen before, add to both arrays (seen, and active)
						if (ds_list_find_index(seen_matchmakers,matchmaker) == -1) {
							ds_list_add(matchmakers,matchmaker);
							ds_list_add(seen_matchmakers,matchmaker);
						}
					}
				}
			}
		}
		//determines if a combo exists
		if (ds_list_size(matchmakers) > 0) {
			var total = 0;
			var minXMatchmaker = noone;
			for (var i = 0; i < ds_list_size(matchmakers); i++) {
				var matchmaker = ds_list_find_value(matchmakers,i);
				if (instance_exists(matchmaker)) {
					total += ds_list_size(matchmaker.final);
					if (minXMatchmaker != noone) {
						if (ds_list_find_value(matchmaker.final,0).x < ds_list_find_value(minXMatchmaker.final,0).x)
							minXMatchmaker = matchmaker;
					}
					else minXMatchmaker = matchmaker
				}
			}
			if (total >= comboSize) {
				var firstMaker = ds_list_find_value(matchmakers,0);
				firstMaker.comboSize = total - (comboSize - 1);
				var comboObj = instance_create_layer(ds_list_find_value(minXMatchmaker.final,0).x - 24,
													 ds_list_find_value(minXMatchmaker.final,0).y - 24,
													 "GUI",
													 obj_combo
										 			);
				comboObj.comboSize = total;
				combo = true;
			}
			if (total > 4) {
				freezeTime = ((total > 12) ? 6 :
							 ((total > 10) ? 5 :
							 ((total > 8)  ? 4 :
 							 ((total > 6)  ? 3 : 
							 ((total > 4)  ? 2 : 0)))));
				if (freezeTime > obj_controller.freezeTime) 
					obj_controller.freezeTime = freezeTime;
			}
		}	
		combo = false; 
		activeComboSize = -1;
		ds_list_clear(matchmakers);
	} 
	
	if (instance_number(obj_matchmaker) == 0) {
		if (obj_controller.freezeTime == freezeTime) && 
		   (freezeTime > 0) {
			obj_controller.freezeTimer = current_time;
			obj_controller.freeze = true;
			freezeTime = 0;
		}	
	}
}