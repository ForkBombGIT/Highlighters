//move match maker up with pieces
if (global.riseUp) {
	y -= global.riseSpeed;
}

while (another) {
	var entity = (ds_stack_size(stack) == 1) ? ds_stack_top(stack) : ds_stack_pop(stack);
	if (instance_exists(entity)) {	
		// destroys other matchmakers
		if (object_get_name(entity.object_index) == "obj_bomb") {
			if (instance_exists(entity.matchmaker) && (origin.id != entity.id)) {
				instance_destroy(entity.matchmaker);
			}
		}
		
		//sets position to next entity in stack
		x = entity.x;
		y = entity.y;
		
		//adds entity to final list
		if (ds_list_find_index(final,entity) == -1) 
			ds_list_add(final,entity);
			
		//adds all adjacent entities to stack
		if (instance_exists(entity.left) && (ds_list_find_index(final,entity.left) == -1)) 
			ds_stack_push(stack,entity.left);
		
		if (instance_exists(entity.right) && (ds_list_find_index(final,entity.right) == -1)) 
			ds_stack_push(stack,entity.right);
			
		if (instance_exists(entity.up) && (ds_list_find_index(final,entity.up) == -1)) 
			ds_stack_push(stack,entity.up);
			
		if  (instance_exists(entity.down) && (ds_list_find_index(final,entity.down) == -1)) 
			ds_stack_push(stack,entity.down);
		
		//if at the end, quit repeating
		if (ds_stack_size(stack) == 1) another = false;
	}
}

if (!another) {	
	if !(alarm[0]) alarm[0] = 15;
}