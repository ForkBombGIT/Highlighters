if (ds_list_size(trail) > 0) {
	ds_list_delete(trail,ds_list_size(trail) - 1);
	alarm[3] = trailDeleteDelay;
} else {
	trailDrawLength = maxTrailLength;
	fallHeight = 0; 
	if (zipSwap) {
		zipSwapDirection = 0;
		zipSwapLength = 0;
	}
}