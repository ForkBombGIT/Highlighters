function scr_getBounceIndex(argument0) {
	var indexNum = argument0;
	var indexMap = ds_map_create();

	ds_map_add(indexMap,0,1);
	ds_map_add(indexMap,1,2);
	ds_map_add(indexMap,2,0);
	ds_map_add(indexMap,3,3);
	ds_map_add(indexMap,4,0);
	ds_map_add(indexMap,5,2);

	return(ds_map_find_value(indexMap,indexNum));


}
