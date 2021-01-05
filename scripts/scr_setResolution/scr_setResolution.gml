function scr_setResolution(index){
	var avMap = ds_map_find_value(global.options,"av");
	if (!ds_map_find_value(avMap,"fullscreen")) {
		var res = scr_getResolution(index);
		window_set_size(res[0],res[1]);	
	}
}