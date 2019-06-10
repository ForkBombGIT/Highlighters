event_inherited(); 
if (global.riseUp) {
	instance_destroy(matchmaker);
	matchmaker = noone;	
}
#region Match Control
if (global.active) && !(global.riseUp) && !(match) && !(swap) {
	switch (ds_list_size(adjacent)) {
		case 4:
		case 3: 
			match = true;
			break;
		case 2:
			for (var i = 0; i < ds_list_size(adjacent); i++) {
				var entity = ds_list_find_value(adjacent,i);
				if (instance_exists(entity)) {
					if ((ds_list_size(entity.adjacent) > 1)) {
						match = true;
						break;
					}
				}
			}
			break;
		case 1:
			var entity = ds_list_find_value(adjacent,0);
			if (instance_exists(entity)) {
				if (ds_list_size(entity.adjacent) > 2) { match = true; break; }
				else {
					for (var i = 0; i < ds_list_size(entity.adjacent); i++) {
						var entityAdj = ds_list_find_value(entity.adjacent,i);
						if (instance_exists(entityAdj)) {
							if ((entityAdj.id != entity.id) && (ds_list_size(entityAdj.adjacent) > 1)) {
								match = true;
								break;
							}
						}
					}
				}
			}
			break;
	}
}

if ((match) && (matchmaker == noone)) 
	matchmaker = scr_createMatchmaker(x,y,index);

#endregion