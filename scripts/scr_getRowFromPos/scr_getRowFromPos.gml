function scr_getRowFromPos(position) {
	if (position <= 48) return 8;
	else if (position <= 96) return 7;
	else if (position <= 144) return 6;
	else if (position <= 192) return 5;
	else if (position <= 240) return 4;
	else if (position <= 288) return 3;
	else if (position <= 336) return 2;
	else if (position <= 384) return 1;
	else if (position <= 432) return 0;
}