//move match maker up with pieces
if (global.riseUp) {
	y -= global.riseSpeed;
}

while (another) {
	var entity = (ds_stack_size(stack) == 1) ? ds_stack_top(stack) : ds_stack_pop(stack);
	if (instance_exists(entity)) {	
		x = entity.x;
		y = entity.y;
		if (instance_exists(entity.left) && (ds_list_find_index(final,entity.left) == -1)) {
			ds_list_add(final,entity.left);
			ds_stack_push(stack,entity.left);
			continue;
		}
		if (instance_exists(entity.right) && (ds_list_find_index(final,entity.right) == -1)) {
			ds_list_add(final,entity.right);
			ds_stack_push(stack,entity.right);
			continue;
		}
		if (instance_exists(entity.up) && (ds_list_find_index(final,entity.up) == -1)) {
			ds_list_add(final,entity.up);
			ds_stack_push(stack,entity.up);
			continue;		
		}
		if  (instance_exists(entity.down) && (ds_list_find_index(final,entity.down) == -1)) {
			ds_list_add(final,entity.down);
			ds_stack_push(stack,entity.down);
			continue;
		}
	}
	
	if (ds_stack_size(stack) == 1) another = false;
}

if (!another) {
	if (!alarm[0]) alarm[0] = 5;	
}