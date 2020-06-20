var activeMatchmakers = instance_number(obj_matchmaker);
if !(global.gameover) &&
   !(global.victory) {
	if !(global.combo) { 
		if (activeMatchmakers > 1) {
			for (var i = 0; i < activeMatchmakers - 1; i++) {
				var matchmaker = instance_find(obj_matchmaker,i);
				var matchmakerPlus = instance_find(obj_matchmaker,i+1);
				if (instance_exists(matchmaker)) {
					if (instance_exists(matchmakerPlus)) {
						if (matchmaker.id != matchmakerPlus.id) {
							//check if the matchmakers "colorIndex" (the color they are matching)
							//and ensure at least one of them is done their match route
							var delete = false;
							if ((matchmaker.colorIndex == matchmakerPlus.colorIndex)) {
								if ((ds_list_size(matchmaker.final) < 4 && !(matchmaker.another)) || 
								    (ds_list_size(matchmakerPlus.final) < 4) && !(matchmakerPlus.another))
									delete = true;
								else {
									for (var k = 0; k < min(ds_list_size(matchmaker.final),ds_list_size(matchmakerPlus.final)); k++) {
										var matchmakerPiece = ds_list_find_value(matchmaker.final,k);
										var matchmakerPlusPiece = ds_list_find_value(matchmakerPlus.final,k);
										if (matchmakerPiece.id == matchmakerPlusPiece.id) {
											delete = true;
											break;
										}
									}
								}
								if (delete) {
									matchmakerPlus.origin.matchOverride = true;
									//add missing pieces from matchmakerPlus into matchmaker final list
									for (var k = 0; k < ds_list_size(matchmakerPlus.final); k++) {
										var matchmakerPlusEntity = ds_list_find_value(matchmakerPlus.final,k);
										if (ds_list_find_index(matchmaker.final,matchmakerPlusEntity) == -1) {
											ds_list_add(matchmaker.final,matchmakerPlusEntity);
										}
									}
									//add missing pieces from matchmakerPlus into matchmaker stack list
									while (ds_stack_size(matchmakerPlus.stack) > 0) {
										var matchmakerPlusEntity = ds_stack_pop(matchmakerPlus.stack);
										matchmakerPlusEntity.match = false;
										ds_stack_push(matchmaker.stack,matchmakerPlusEntity);
									}
									ds_stack_push(matchmaker.stack,matchmakerPlus.origin);
									show_debug_message(matchmakerPlus)
									instance_destroy(matchmakerPlus);
								}
							}
						}
					}
				}
			}
		}
		//Create a list of matchmakers that have just finished building their match
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
		
		//Match size calculation
		if (ds_list_size(matchmakers) > 0) {
			show_debug_message(ds_list_size(matchmakers));
			var total = 0;
			var minXMatchmaker = noone;
			for (var i = 0; i < ds_list_size(matchmakers); i++) {
				var matchmaker = ds_list_find_value(matchmakers,i);
				if (instance_exists(matchmaker)) {
					if (instance_exists(matchmaker.justLandedEntity)) {
						if (chainStart) {
							var chainObj = instance_create_layer(matchmaker.justLandedEntity.x - 24,
																 matchmaker.justLandedEntity.y - 24,
													             "GUI",
													             obj_chain
							);
							chainObj.chainSize = chainSize++;
						}
					}
					
					total += ds_list_size(matchmaker.final);
					if (minXMatchmaker != noone) {
						if (ds_list_find_value(matchmaker.final,0).x < ds_list_find_value(minXMatchmaker.final,0).x)
							minXMatchmaker = matchmaker;
					}
					else minXMatchmaker = matchmaker
				}
			}
			
			//Score and level increase calculations
			var sizeOfCombo = total - (comboSize);
			global.gameScore = min(global.gameScore + (total * baseScoreInc) + max(0,sizeOfCombo * comboBonus) + max(0,chainSize * chainBonus),
								   global.victoryScore);
								   
			global.combo = sizeOfCombo > 0;
			global.chain = (chainStart && chainSize > 0);

			if !(global.practice) {
				//checks if level is at x99, if it is, follow normal combo behavior
				var comboChain = global.combo && global.chain;
				var levelIncrement = (comboChain) ? 4 : (sizeOfCombo > 0) + ((chainStart && chainSize > 0) * 2) + 1
				if (global.gameLevel % global.levelToMatch == global.levelToMatch - 1)
					global.gameLevel = global.gameLevel + levelIncrement;
				//otherwise 
				else global.gameLevel = min(global.gameLevel + levelIncrement,
											(floor((global.gameLevel / global.levelToMatch) % 10) * global.levelToMatch) + global.levelToMatch - 1);
				global.gameLevel = min(global.gameLevel, global.maxLevel - 1);
			}
			
			if (total >= comboSize) {
				show_debug_message(sizeOfCombo)
				var comboObj = instance_create_layer(ds_list_find_value(minXMatchmaker.final,0).x - 24,
													 ds_list_find_value(minXMatchmaker.final,0).y - 24,
													 "GUI",
													 obj_combo
										 			);
				comboObj.comboSize = sizeOfCombo;
				
				//Combo freeze time
				freezeTime = ((total > 12) ? 6 :
							 ((total > 10) ? 5 :
							 ((total > 8)  ? 4 :
 							 ((total > 6)  ? 3 : 
							 ((total > 4)  ? 2 : 0)))));
			}
			
			//Chain freeze time
			if (chainSize > 0) {
				// plus one to chainsize, as it's offset by 1
				freezeTime = (chainSize + 1) + 2;
			}
			
			//Update freeze time, if needed
			if (freezeTime > obj_controller.freezeTime) {
				obj_controller.freezeTime = freezeTime;
				obj_controller.freezeTimer = current_time;
				global.freeze = true;
			}
			chainStart = true;
		}	
		global.combo = false; 
		activeComboSize = -1;
		ds_list_clear(matchmakers);
	} 
	if (instance_number(obj_matchmaker) == 0) {
		if (obj_controller.freezeTime == freezeTime) && 
		   (freezeTime > 0) {
			obj_controller.freezeTimer = current_time;
			freezeTime = 0;
		}
		
		var continueChain = false;
		with (par_entity) {
			if (floating) || !(bottomEntity) || (justLanded)
				continueChain = true;
		}
		
		if !(continueChain) && chainStart {
			chainSize = 0;
			chainStart = false;
			global.chain = false;
		}
	}
}