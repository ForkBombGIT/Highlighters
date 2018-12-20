if (keyboard_check_pressed(vk_anykey)) {
	room_instance_add(rm_main,x,y,obj_controller)
	room_goto_next();		
}