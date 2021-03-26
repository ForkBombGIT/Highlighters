if (fallHeight > maxTailLength) || (zipSwapLength > maxTailLength) && !(match) {
	for (var i = 0; i < ds_list_size(tail) - tailDrawLength; i++) {
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
		if (zipSwap == 0) && (fallHeight > maxTailLength)
			yPos -= 48 * (i + 1);
		draw_sprite(ds_list_find_value(tail,i),index + offset,x - zipSwapDirection * 48 * (i + 1),
															  yPos);
	}
}