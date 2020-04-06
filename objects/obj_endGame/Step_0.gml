#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
	flash = true;
	alarm[0] = 2;		
	
}

if (keyboard_check_pressed(ds_map_find_value(global.controls,"UP"))) {
	if (endCursor > 0) {
		endCursor--;	
	}
}

if (keyboard_check_pressed(ds_map_find_value(global.controls,"DOWN"))) {
	if (endCursor < 2) {
		endCursor++;	
	}
}
#endregion

//Menu option animation
var animSpeed = 0.2;
if (round(endOptionAnim) < 7){
	endOptionAnim += animSpeed;
} else endOptionAnim = 1;

animSpeed = 0.5;
if (round(gameoverAnim) < 16) && !(stopGameoverAnim){
	gameoverAnim += animSpeed;
} 
if (round(gameoverAnim) >= 15	) {
	stopGameoverAnim = false;
	gameoverAnim = 15;
}

if (restart) {
	instance_create_layer(x,y,"Entities",obj_controller);	
	instance_create_layer(168,window_get_height()/4,"GUI",obj_countdown);
	instance_destroy();
}