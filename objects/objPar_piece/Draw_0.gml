/*
if (fallHeight > maxTrailLength) || (zipSwapLength > maxTrailLength) && !(match) {
	for (var i = 0; i < ds_list_size(trail) - trailDrawLength; i++) {
		var offset = 0;
		switch (i) { 
			case 0:
				offset = 6;
				break;
			case 1:
				offset = 4;
				break;
		}
		var yPos = y;
		if (zipSwap == 0) && (fallHeight > maxTrailLength)
			yPos -= 48 * (i + 1);
		draw_sprite(ds_list_find_value(trail,i),index + offset,x - zipSwapDirection * 48 * (i + 1),
															  yPos);
	}
}
*/