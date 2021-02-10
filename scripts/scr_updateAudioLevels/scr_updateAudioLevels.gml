function scr_updateAudioLevels(){
	var avMap = ds_map_find_value(global.options,"av");
	var musicVol = ds_map_find_value(avMap,"musicVol") / 600;
	var soundVol = ds_map_find_value(avMap,"soundVol") / 100;

	if (audio_group_is_loaded(ag_music)) {
		audio_group_set_gain(ag_music,musicVol,0);	
	}

	if (audio_group_is_loaded(ag_sound)) {
		audio_group_set_gain(ag_sound,soundVol,0);	
	}
}