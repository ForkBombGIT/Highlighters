if (axis == "h") {
	if (scr_getPieceAtPos(x,y).index != colorIndex) {
		for (var i = 0; i < array_length_1d(visited); i++) {
			if (scr_getPieceAtPos(x,y) != visited[i])
				visited[array_length_1d(visited)] = scr_getPieceAtPos(x,y);
		}
	}
	
	switch (dir) {
		case 0: 
			x -= 48;
			break;
		case 1: 
			x += 48;
			break;
		case 2: 
			y -= 48;
			break;
		case 3: 
			y += 48;
			break;
	}
	
}