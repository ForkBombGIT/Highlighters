#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A")) || 
    keyboard_check_pressed(ds_map_find_value(global.controls,"SELECT"))) {
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

animSpeed = 2 / room_speed;
if (round(gameoverAnim) < 2){
	gameoverAnim += animSpeed;
} else gameoverAnim = 0;

if (restart) {
	instance_create_layer(x,y,"Entities",obj_controller);	
	instance_create_layer(168,window_get_height()/4,"GUI",obj_countdown);
	instance_destroy();
}