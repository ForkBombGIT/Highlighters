event_inherited(); 

#region Match Control
if (global.active) && !(global.riseUp) && !(match){
	//horizontal match
	if (instance_exists(left)  || 
		instance_exists(right) ||
		instance_exists(up)    || 
		instance_exists(down)) { 
		match = true;
		scr_createMatchmaker(x,y,index);
	}
}
#endregion