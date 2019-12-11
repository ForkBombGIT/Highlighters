var activeMatchmakers = instance_number(obj_matchmaker);
if !(combo) { //possibly remove this?
	if (activeMatchmakers > 1) {
		for (var i = 0; i < activeMatchmakers - 1; i++) {
			var matchmaker = instance_find(obj_matchmaker,i);
			var matchmakerPlus = instance_find(obj_matchmaker,i+1);
			var deletion = false;
			if (instance_exists(matchmaker)) {
				if (instance_exists(matchmakerPlus)) {
					if (matchmaker.colorIndex == matchmakerPlus.colorIndex) {
						for (var j = 0; j < ds_list_size(matchmaker.final); j++){
							if (ds_list_find_value(matchmakerPlus.final,j) == matchmakerPlus.origin) {
								matchmakerPlus.origin.matchOverride = true;
								matchmakerPlus.origin.match = false;
								instance_destroy(matchmakerPlus);
								deletion = true;
								break;
							}
						}
					}
				}
				if (deletion) break;
				//find matchmaker in matchmakers list
				var val = ds_list_find_value(matchmakers,matchmaker.id)
				//if exists, remove it from active matchmakers list
				if (val) ds_list_delete(matchmakers,val.id);
				//otherwise
				else {
					//if it has never been seen before, add to both arrays (seen, and active)
					if !(ds_list_find_value(seen_matchmakers,matchmaker.id)) {
						ds_list_add(matchmakers,matchmaker.id);
						ds_list_add(seen_matchmakers,matchmaker.id);
					}
				}
			}
		}
	
		if (ds_list_size(matchmakers) > 1) {
			show_debug_message("combo!");
			combo = true;
		}	
	
		ds_list_clear(matchmakers);
	
	} else combo = false;
} 