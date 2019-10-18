var activeMatchmakers = instance_number(obj_matchmaker);
show_debug_message(activeMatchmakers)
if (activeMatchmakers > 1) {
	for (var i = 0; i < activeMatchmakers - 1; i++) {
			var matchmaker = instance_find(obj_matchmaker,i);
			var matchmakerPlus = instance_find(obj_matchmaker,i+1);
			var deletion = false;
			if (instance_exists(matchmaker) && instance_exists(matchmakerPlus)) {
				if (matchmaker.colorIndex == matchmakerPlus.colorIndex) {
					for (var j = 0; j < ds_list_size(matchmaker.final); j++){
						if (ds_list_find_value(matchmakerPlus.final,j) == matchmakerPlus.origin) {
							matchmakerPlus.origin.matchOverride = true;
							matchmakerPlus.origin.match = false;
							instance_destroy(matchmakerPlus);
							break;
						}
					}
				
				}
			}
		if (deletion) break;
	}
}	