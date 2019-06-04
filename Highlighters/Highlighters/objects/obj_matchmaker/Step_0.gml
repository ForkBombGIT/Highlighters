//move match maker up with pieces
if (global.riseUp) {
	y -= global.riseSpeed;
}

while (another) {
	var entity = (ds_stack_size(stack) == 1) ? ds_stack_top(stack) : ds_stack_pop(stack);
	if (instance_exists(entity)) {	
		x = entity.x;
		y = entity.y;
		
		if (ds_list_find_index(final,entity) == -1) 
			ds_list_add(final,entity);
			
		if (instance_exists(entity.left) && (ds_list_find_index(final,entity.left) == -1)) 
			ds_stack_push(stack,entity.left);
		
		if (instance_exists(entity.right) && (ds_list_find_index(final,entity.right) == -1)) 
			ds_stack_push(stack,entity.right);
			
		if (instance_exists(entity.up) && (ds_list_find_index(final,entity.up) == -1)) 
			ds_stack_push(stack,entity.up);
			
		if  (instance_exists(entity.down) && (ds_list_find_index(final,entity.down) == -1)) 
			ds_stack_push(stack,entity.down);
			
		if (ds_stack_size(stack) == 1) another = false;
	}
}

if (!another) {
	if (!alarm[0]) alarm[0] = 45;	
}