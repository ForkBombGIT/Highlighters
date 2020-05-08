#region Menu navigation
if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
	flash = true;
	if (endCursor == 1) instance_destroy(obj_characterPortrait);
	alarm[0] = 2;		
}

if (keyboard_check_pressed(ds_map_find_value(global.controls,"UP"))) {
	if (endCursor > 0) {
		endCursor--;	
	}
}

if (keyboard_check_pressed(ds_map_find_value(global.controls,"DOWN"))) {
	if (endCursor < 1) {
		endCursor++;	
	}
}
#endregion

//Menu option animation
var animSpeed = optionSpeed / room_speed;
endOptionAnim += animSpeed;
if (floor(endOptionAnim) > 6) {
	endOptionAnim = 1;
} 

animSpeed = gameoverSpeed / room_speed;
gameoverAnim += animSpeed;
if (floor(gameoverAnim) > 15) && !(stopGameoverAnim){
	stopGameoverAnim = false;
	gameoverAnim = 15;
} 

if (restart) {
	instance_create_layer(x,y,"Entities",obj_controller);	
	instance_create_layer(168,window_get_height()/4,"GUI",obj_countdown);
	instance_destroy();
}