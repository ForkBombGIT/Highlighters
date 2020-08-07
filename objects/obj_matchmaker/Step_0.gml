//move match maker up with pieces
if (global.riseUp) &&
  !(global.riseBrake) {
	y -= global.riseAmount;
}
//loop until no more new pieces
while (another) {
	var entity = (ds_stack_size(stack) == 1) ? ds_stack_top(stack) : ds_stack_pop(stack);
	if (instance_exists(entity)) {	
		//sets position to next entity in stack
		x = entity.x;
		y = entity.y;
		entity.landAnim = false; 
		
		if (object_get_name(entity.object_index) == "obj_bomb") {
			ds_list_add(bombs,entity);	
		}
		
		if (entity.justLanded && entity.aboveMatch)
			justLandedEntity = entity;
		
		//adds entity to final list
		if (ds_list_find_index(final,entity) == -1) {
			ds_list_add(final,entity);
		}
			
		//adds all adjacent entities to stack	
		if  (instance_exists(entity.down) && (ds_list_find_index(final,entity.down) == -1)) 
			ds_stack_push(stack,entity.down);
			
		if (instance_exists(entity.up) && (ds_list_find_index(final,entity.up) == -1)) 
			ds_stack_push(stack,entity.up);
			
		if (instance_exists(entity.left) && (ds_list_find_index(final,entity.left) == -1)) 
			ds_stack_push(stack,entity.left);
		
		if (instance_exists(entity.right) && (ds_list_find_index(final,entity.right) == -1)) 
			ds_stack_push(stack,entity.right);
		
		
		//if at the end, quit repeating
		if (ds_stack_size(stack) == 1) {
			another = false;
		}
	}
}

//loops over all pieces to check if anything was missed
if !(animating) {
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i);
		if (instance_exists(entity.up) && (ds_list_find_index(final,entity.up) == -1)) 
			ds_stack_push(stack,entity.up);
			
		if (instance_exists(entity.left) && (ds_list_find_index(final,entity.left) == -1)) 
			ds_stack_push(stack,entity.left);
		
		if (instance_exists(entity.right) && (ds_list_find_index(final,entity.right) == -1)) 
			ds_stack_push(stack,entity.right);
			
		if  (instance_exists(entity.down) && (ds_list_find_index(final,entity.down) == -1)) 
			ds_stack_push(stack,entity.down);
	}

	//if the stack is greater than 1, loop again 
	if (ds_stack_size(stack) > 1) {
		another = true;
	}

	//if list is too small, abort match making
	/*
	if (ds_list_size(final) < 4) && !(another) {
		for (var i = 0; i < ds_list_size(final); i++) {
			var entity = ds_list_find_value(final,i);
			entity.match = false;
		}
		origin.match = false;
		instance_destroy();
	}
	*/
}

//begin highlighting
if (!another) && !(animating) {
	if !(alarm[0]) alarm[0] = 1;
}

if (animationComplete) {
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i);
		if (entity.highlighting != 2) {
			clearFinalList = false;
		}	
		
		if (i == ds_list_size(final) - 1) {
			if (entity.highlighting == 2)
				clearFinalList = true;
		}	
	}
}

if (clearFinalList) {
	for (var i = 0; i < ds_list_size(final); i++) {
		var entity = ds_list_find_value(final,i);
		instance_destroy(entity);
	}	
	instance_destroy();	
}