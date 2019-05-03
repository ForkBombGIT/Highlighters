//move match maker up with pieces
if (global.riseUp) {
	y -= global.riseSpeed;
}

//init direction
if (dir == -1) {
	dir = 0;
}

//horizontal behavior
if (axis == "h") {
	var piece = instance_position(x,y,par_entity);
	if (instance_exists(piece) && 
	(piece.image_index == colorIndex) && 
	(ds_list_find_index(visited,piece.id) == -1)) {
		ds_list_add(visited,piece);
		switch(dir) {
			case 0:
				x -= 48;
			break;
			case 1:
				x += 48;
			break;	
		}
	}
	else {
		if (dir == 1) {
			if !(alarm[0]) alarm[0] = 5;
		}
		else {
			x = ds_list_find_value(visited,0).x + 48;
			dir = 1;
		}
	}
	
}
//vertical behavior
else if (axis == "v") {	
	var piece = instance_position(x,y,par_entity);
	if (instance_exists(piece) && 
	(piece.image_index == colorIndex) && 
	(ds_list_find_index(visited,piece.id) == -1)) {
		ds_list_add(visited,piece);
		switch(dir) {
			case 0:
				y += 48;
			break;
			case 1:
				y -= 48;
			break;	
		}
	}
	else {
		if (dir == 1) {
			if !(alarm[0]) alarm[0] = 5;
		}
		else {
			y = ds_list_find_value(visited,0).y - 48;
			dir = 1;
		}
	}
}