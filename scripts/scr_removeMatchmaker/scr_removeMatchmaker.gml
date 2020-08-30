function scr_removeMatchmaker(argument0, argument1) {
	var matchmakerOne = argument0;
	var matchmakerTwo = argument1;

	if (instance_exists(matchmakerOne) && instance_exists(matchmakerTwo)) {
		matchmakerTwo.origin.matchOverride = true;
		//add missing pieces from matchmakerPlus into matchmaker final list
		for (var k = 0; k < ds_list_size(matchmakerTwo.final); k++) {
			var matchmakerTwoEntity = ds_list_find_value(matchmakerTwo.final,k);
			if (ds_list_find_index(matchmakerOne.final,matchmakerTwoEntity) == -1) {
				ds_list_add(matchmakerOne.final,matchmakerTwoEntity);
			}
		}
		//add missing pieces from matchmakerPlus into matchmaker stack list
		while (ds_stack_size(matchmakerTwo.stack) > 0) {
			var matchmakerTwoEntity = ds_stack_pop(matchmakerTwo.stack);
			matchmakerTwoEntity.match = false;
			ds_stack_push(matchmakerOne.stack,matchmakerTwoEntity);
		}
		ds_stack_push(matchmakerOne.stack,matchmakerTwo.origin);
		instance_destroy(matchmakerTwo);
	}


}
