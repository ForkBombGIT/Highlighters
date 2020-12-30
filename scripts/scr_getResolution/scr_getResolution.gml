function scr_getResolution(index){
	switch (index) {
		case 0:
			return [160,144];
		case 1: 
			return [320,288];
		case 2:
			return [480,432];
		case 3:
			return [640,576];
		case 4:
			return [800,720];
		case 5:
			return [960,864];
	}
}