function scr_generateBombFrequency(){
	var bombFrequency = ds_map_create();
	for (var i = 0; i < instance_number(obj_bomb); i++) {
		var bomb = instance_find(obj_bomb,i);
		var frequency = ds_map_find_value(bombFrequency,bomb.index);
		if (ds_map_find_value(bombFrequency,bomb.index) == undefined) {
			ds_map_add(bombFrequency,bomb.index,1);
		} else ds_map_set(bombFrequency,bomb.index,frequency + 1);
	}
	return bombFrequency;
}