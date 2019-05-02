event_inherited(); 

#region Match Control
if (global.active) && !(match){
	//horizontal match
	if (instance_exists(left) && (instance_exists(left.left))) {
		if (object_get_name(left.object_index) == "obj_piece" && 
		object_get_name(left.left.object_index) == "obj_piece") {
			match = true;
			scr_createMatchmaker(x,y,"h",index);
		}
	}
	else if (instance_exists(right) && instance_exists(right.right)) {
		if (object_get_name(right.object_index) == "obj_piece" && 
		object_get_name(right.right.object_index) == "obj_piece") {
			match = true;
			scr_createMatchmaker(x,y,"h",index);
		}
	}
	
	//vertical match	
	else if (instance_exists(up) && (instance_exists(up.up))) {
		if (object_get_name(up.object_index) == "obj_piece" && 
		object_get_name(up.up.object_index) == "obj_piece") {
			match = true;
			scr_createMatchmaker(x,y,"v",index);
		}
	}
	else if (instance_exists(down) && instance_exists(down.down)) {
		if (object_get_name(down.object_index) == "obj_piece" && 
		object_get_name(down.down.object_index) == "obj_piece") {
			match = true;
			scr_createMatchmaker(x,y,"v",index);
		}
	}
}
#endregion