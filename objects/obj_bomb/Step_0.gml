event_inherited(); 
if (matchOverride) match = true;

//pulse animation
if (global.pulse)  &&
   (global.active) && 
   (y <= scr_getRowPos(0)) &&
   (image_index != index + 3) &&
  !(global.riseUp) && 
  !(bounce) && 
  !(match) && 
  !(swap) && 
  !(global.gameover) &&
  !(global.victory) &&
  !(instance_exists(matchmaker)) {
	image_index = index + floor(objCtrl_gameAnimation.pulseIndex);
  }

#region Match Control
if (global.active) && 
  !(global.riseUp) && 
  !(matchOverride) && 
  !(match) && 
  !(swap) && 
  (global.gameScore < global.victoryScore) &&
  !(instance_exists(matchmaker)) {
	switch (ds_list_size(adjacent)) {
		case 4: //match behavior for 4 adjacent pieces
		case 3: //match behavior for 3 adjacent pieces, automatic match
			matchFound = true;
			break;
		case 2: //match behavior for 2 adjacent pieces, check for adjacents in adjacent pieces
			for (var i = 0; i < ds_list_size(adjacent); i++) {
				var entity = ds_list_find_value(adjacent,i);
				if (instance_exists(entity)) {
					if ((ds_list_size(entity.adjacent) > 1)) {
						matchFound = true;
						break;
					}
				}
			}
			break;
		case 1: //match behavior for 1 adjacent piece,  check for adjacents in adjacent pieces
			var entity = ds_list_find_value(adjacent,0);
			if (instance_exists(entity)) {
				//checks if the single adjancet piece has more than 2 adjacent to it
				if (ds_list_size(entity.adjacent) > 2) { matchFound = true; break; }
				else {
					//iterate through adjacent pieces, this is the case where the single adjacent piece has 
					//less that two adjacent pieces to it
					for (var i = 0; i < ds_list_size(entity.adjacent); i++) {
						var entityAdj = ds_list_find_value(entity.adjacent,i);
						if (instance_exists(entityAdj)) {
							if ((entityAdj.id != entity.id) && (ds_list_size(entityAdj.adjacent) > 1)) {
								matchFound  = true;
								break;
							}
						}
					}
				}
			}
			break;
	}
}

if ((matchFound) && 
	!(matchOverride) && 
	!(instance_exists(matchmaker)) && 
	!(global.gameover || global.victory)) { 
	matchmaker = scr_createMatchmaker(x,y,index);
}

#endregion