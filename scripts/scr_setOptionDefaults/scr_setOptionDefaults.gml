function scr_setOptionDefault(defaultOptions,option) {
	if (ds_map_find_value(global.options,option) != -1) {
		ds_map_delete(global.options,option)	
	}
	//apply default input to options map
	var defaultKeys = ds_map_keys_to_array(ds_map_find_value(defaultOptions,option));
	var options = ds_map_create();
	for (var i = 0; i < array_length(defaultKeys); i++) {
		ds_map_add(options,defaultKeys[i],ds_map_find_value(ds_map_find_value(defaultOptions,option),
															   defaultKeys[i]));
	}
	ds_map_add_map(global.options,option,options);
}