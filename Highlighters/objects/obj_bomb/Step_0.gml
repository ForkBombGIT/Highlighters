event_inherited(); 
#region Match Control
if (!swap) && (!obj_controller.newRow){
	//checks if there is a tile below
	//that matches
	if (instance_exists(down)){
		with (down) {
			if (instance_exists(left)   || 
				instance_exists(right)  ||  
				instance_exists(down)) { 
				match = true;
				other.match = true;
			}
		} 
	}
	//checks if there is a tile left
	//that matches
	if (instance_exists(left)){
		with (left) {
			if (instance_exists(left)   || 
				instance_exists(up)  ||  
				instance_exists(down)) { 
				match = true;
				other.match = true;
			}
		} 
	}
	//checks if there is a tile right
	//that matches
	if (instance_exists(right)){
		with (right) {
			if (instance_exists(right)   || 
				instance_exists(up)  ||  
				instance_exists(down)) { 
				match = true;
				other.match = true;
			}
		} 
	}
}
#endregion