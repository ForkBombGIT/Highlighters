event_inherited(); 
#region Match Control
if (!swap) && (global.active) && (bottomEntity){
	//checks if there is a tile below
	//that matches
	if (instance_exists(down)){
		if (instance_exists(left) || instance_exists(right) || instance_exists(up)) match = true;
		else if (!down.swap && down.bottomEntity){
			if (instance_exists(down.left) || instance_exists(down.right) || instance_exists(down.down)) {
				match = true;
			}
		}
	}
	//checks if there is a tile left
	//that matches
	if (instance_exists(left)){
		if (instance_exists(right) || instance_exists(down) || instance_exists(up)) match = true;
		else if (!left.swap && left.bottomEntity){
			if (instance_exists(left.left) || instance_exists(left.up) || instance_exists(left.down)) {
				match = true;
			}
		} 
	}
	//checks if there is a tile right
	//that matches
	if (instance_exists(right)){
		if (instance_exists(left) || instance_exists(down) || instance_exists(up)) match = true;
		else if (!right.swap && right.bottomEntity){
			if (instance_exists(right.up) || instance_exists(right.right) || instance_exists(right.down)) {
				match = true;
			} 
		}
	}
	//checks if there is a tile up
	//that matches
	if (instance_exists(up)){
		if (!up.swap && up.bottomEntity){
			if (instance_exists(up.left) || instance_exists(up.right) || instance_exists(up.up)) {
				match = true;
			}
		}
	}
}
#endregion