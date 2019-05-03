event_inherited(); 

#region Match Control
if (global.active) && !(global.riseUp) && !(match){
	if (instance_exists(left)) { 
		if (instance_exists(left.left) || 
			instance_exists(left.up)   ||
			instance_exists(left.down)) 
		match = true;
	}
	else if (instance_exists(right)) {
		if (instance_exists(right.right) || 
			instance_exists(right.up)   ||
			instance_exists(right.down)) 
		match = true;
	}
	else if (instance_exists(up)) {
		if (instance_exists(up.left) || 
			instance_exists(up.right)   ||
			instance_exists(up.up)) 
		match = true;
	}
	else if (instance_exists(down)) {
		if (instance_exists(down.left) || 
			instance_exists(down.right)   ||
			instance_exists(down.down)) 
		match = true;
	}
}

if ((match) && (matchmaker == noone)) 
	matchmaker = scr_createMatchmaker(x,y,index);

#endregion