function scr_setAudioVideoDefaults(defaultOptions) {
	if (ds_map_find_value(global.options,"av") != -1) {
		ds_map_delete(global.options,"av")	
	}
	var defaultAudioVideoKeys = ds_map_keys_to_array(ds_map_find_value(defaultOptions,"av"));
	var audioVideo = ds_map_create();
	for (var i = 0; i < array_length(defaultAudioVideoKeys); i++) {
		ds_map_add(audioVideo,defaultAudioVideoKeys[i],ds_map_find_value(ds_map_find_value(defaultOptions,"av"),
															             defaultAudioVideoKeys[i]));
	}
	ds_map_add_map(global.options,"av",audioVideo);
}