function scr_getRiseSpeed(level) {
	if (level < 100) {
		if (level < 50) return 90;
		else return 80
	}
	else if (level < 200) {
		if (level < 150) return 70;
		else if (level < 180) return 60;
		else return 50;
	}
	else if (level < 300) {
		if (level < 250) return 40;
		else return 35;
	}
	else if (level < 400) {
		if (level < 350) return 30;
		else return 25;
	}
	else if (level < 500) {
		if (level < 420) return 20;
		else if (level < 450) return 15;
		else return 10;
	}
	else {
		if (level < 600) return 6;
		else if (level < 700) return 5;
		else if (level < 800) return 4;
		else if (level < 900) return 3;
		return 2;
	}



}
