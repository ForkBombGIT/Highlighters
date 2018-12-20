if !(pause) {	
	//counts time
	milli = current_time - offset
	if (milli >= 1000) {offset += 1000; seconds += 1;} 
	if (seconds >= 60) {seconds = 0; minutes += 1;}	
}

#region Pause Handling
if (keyboard_check_pressed(vk_escape)){
	pause = !pause;
	if(!sprite_exists(screenShot)){
        screenShot = sprite_create_from_surface(application_surface,0,0,768,672,0,0,0,0);    
    }
}

if(pause){
    instance_deactivate_all(1);
}else{
    if(sprite_exists(screenShot)){
        sprite_delete(screenShot);
    }
    instance_activate_all();
}
#endregion