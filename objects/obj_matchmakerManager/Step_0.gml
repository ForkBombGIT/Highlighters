var activeMatchmakers = instance_number(obj_matchmaker);

// matchmaker management loop
if !(global.gameover) &&
   !(global.victory) {
	if !(global.combo) { 
		if (activeMatchmakers > 1) {
			for (var i = 0; i < activeMatchmakers - 1; i++) {
				var matchmaker = instance_find(obj_matchmaker,i);
				if (instance_exists(matchmaker)) {
					for (var j = 0; j < ds_list_size(matchmaker.bombs); j++) {
						var bomb = ds_list_find_value(matchmaker.bombs,j);
						if (bomb.matchmaker != matchmaker)
							scr_removeMatchmaker(matchmaker,bomb.matchmaker);
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
					if (val != -1) {
						ds_list_delete(matchmakers,val);
					}
					//otherwise
					else {
						//if it has never been seen before, add to both arrays (seen, and active)
						if (ds_list_find_index(seenMatchmakers,matchmaker) == -1) {
							ds_list_add(matchmakers,matchmaker);
							ds_list_add(seenMatchmakers,matchmaker);
						}
					}
				}
			}
		}
		
		//Match size calculation
		if (ds_list_size(matchmakers) > 0) {
			var total = 0;
			var minXMatchmaker = noone;
			var entityChainStart = false;
			for (var i = 0; i < ds_list_size(matchmakers); i++) {
				var matchmaker = ds_list_find_value(matchmakers,i);
				if (instance_exists(matchmaker)) {
					if (instance_exists(matchmaker.justLandedEntity)) {
						if (chainStart) && (current_time - lastChainCreation >= 100) {
							audio_play_sound(snd_combo_chain,2,0);
							var chainObj = instance_create_layer(matchmaker.justLandedEntity.x - 24,
																 matchmaker.justLandedEntity.y - 24,
													             "Notifications",
													             obj_chain
							);
							chainObj.chainSize = chainSize++;
							lastChainCreation = current_time;
							entityChainStart = true;
						}
					}
					
					total += ds_list_size(matchmaker.final);
					if (minXMatchmaker != noone) {
						if (ds_list_find_value(matchmaker.final,0).x < ds_list_find_value(minXMatchmaker.final,0).x)
							minXMatchmaker = matchmaker;
					}
					else minXMatchmaker = matchmaker
					
					if (matchmaker.animating && !matchmaker.flicker) {
						ds_list_delete(matchmakers,i);	
					}
				}
			}
			
			if !(entityChainStart) global.chain = false;
			
			//Score and level increase calculations
			var panic = false;
			with (objPar_piece) {
				if (bounce || squish) panic = true;
			}
			var sizeOfCombo = total - (comboSize);
			global.gameScore = min(global.gameScore + ((sizeOfCombo < 0) ? 100 * (1 + panic) : 0) + 
								   max(0,((sizeOfCombo + 1) * (comboBonus + (panic ? 50 : 0)))) + 
								   max(0,(chainSize * chainBonus + (panic ? 100 : 0))),
								   global.victoryScore);
								   
			if (global.gameScore >= global.victoryScore) {
				global.victory = true;
				objCtrl_gameAnimation.gameEndCol = 0;
				objCtrl_gameAnimation.gameEndRow = objCtrl_gameSession.boardHeight - 1;
			}
								   
			global.combo = sizeOfCombo >= 0;
			global.chain = (chainStart && chainSize > 0);
			
			if (global.combo) && !(global.victory) && !(global.chain) {
				audio_play_sound(snd_combo_chain,2,0);	
			}

			if !(global.gameMode == 1) {
				//checks if level is at x99, if it is, follow normal combo behavior
				//var comboChain = global.combo && global.chain;
				var comboLevelBonus = (global.combo) ? (sizeOfCombo > 9 ? 20 : sizeOfCombo) : 0;
				var chainLevelBonus = (chainStart && chainSize > 0) ? (chainSize > 8 ? 20 : 2 * chainSize) : 0;;
				var levelIncrement = comboLevelBonus + chainLevelBonus + (comboLevelBonus + chainLevelBonus == 0)	
				if (global.gameLevel % global.levelToMatch == global.levelToMatch - 1) {
					global.gameLevel = global.gameLevel + levelIncrement + carryOverLevels;
					carryOverLevels = 0;
				}
				//otherwise 
				else global.gameLevel = min(global.gameLevel + levelIncrement,
										   (floor((global.gameLevel / global.levelToMatch) % 10) * global.levelToMatch) + global.levelToMatch - 1);
				global.gameLevel = min(global.gameLevel, global.maxLevel - 1);
			}
			
			if (total >= comboSize) && (chainSize == 0) {
				var comboObj = instance_create_layer(ds_list_find_value(minXMatchmaker.final,0).x - 24,
													 ds_list_find_value(minXMatchmaker.final,0).y - 24,
													 "Notifications",
													 obj_combo
										 			);
				comboObj.comboSize = sizeOfCombo;
				
				// Combo freeze time
				freezeTime = ((total > 12) ? 6 :
							 ((total > 10) ? 5 :
							 ((total > 8)  ? 4 :
 						     ((total > 6)  ? 3 : 
							 ((total > 4)  ? 2 : 0)))));
				// panic bonus
				if (total > 4) {
					freezeTime += panic;	
				}
			}
			
			//Chain freeze time
			if (chainSize > 0) {
				// plus one to chainsize, as it's offset by 1
				freezeTime = (chainSize + 1) + 2 + panic;
			}
			
			//Update freeze time, if needed
			if (freezeTime > objCtrl_gameSession.freezeTime) {
				objCtrl_gameSession.freezeTime = freezeTime;
				objCtrl_gameSession.freezeTimer = current_time;
				global.freeze = true;
			}
			chainStart = true;
		}	
		global.combo = false; 
		activeComboSize = -1;
		freezeTime = 0;
	} 
	
	if (instance_number(obj_matchmaker) == 0) {
		ds_list_clear(matchmakers);
	}
	
	var continueChain = false;
	with (objPar_piece) {
		if (aboveMatch)
			continueChain = true;
	}
		
	if !(continueChain) && chainStart {
		chainSize = 0;
		chainStart = false;
		global.chain = false;
	}
}