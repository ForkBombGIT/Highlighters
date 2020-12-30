function scr_setInputOptions(defaultOptions){
	if (ds_map_find_value(global.options,"input") != -1) {
		ds_map_delete(global.options,"input")	
	}
	//apply default input to options map
	var defaultInputKeys = ds_map_keys_to_array(ds_map_find_value(defaultOptions,"input"));
	var input = ds_map_create();
	for (var i = 0; i < array_length(defaultInputKeys); i++) {
		ds_map_add(input,defaultInputKeys[i],ds_map_find_value(ds_map_find_value(defaultOptions,"input"),
															   defaultInputKeys[i]));
	}
	ds_map_add_map(global.options,"input",input);
}