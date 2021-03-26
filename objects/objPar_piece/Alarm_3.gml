if (ds_list_size(tail) > 0) {
	ds_list_delete(tail,ds_list_size(tail) - 1);
	alarm[3] = tailDeleteDelay;
} else {
	tailDrawLength = maxTailLength;
	fallHeight = 0; 
	if (zipSwap) {
		zipSwapDirection = 0;
		zipSwapLength = 0;
	}
}