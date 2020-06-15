if (instance_exists(obj_startScreen)) instance_destroy(obj_startScreen);
global.active = true;	
global.fastAnim = false;
obj_controller.riseTimer = current_time;