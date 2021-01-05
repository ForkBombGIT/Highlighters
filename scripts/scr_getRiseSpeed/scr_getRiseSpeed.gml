function scr_getRiseSpeed(argument0) {
	// Gabe Fabia helped develop the function used here.
	// temporary implementation
	var playerScore = argument0 - (argument0 % 10);

	var minRiseSpeed = 90;
	var decrement = 3;

	if (playerScore < 100) {
		if (playerScore < 40) return 90;
		else if (playerScore < 90) return (playerScore % 30 == 10) ? (minRiseSpeed - floor(playerScore / 30)) :
																	 (scr_getRiseSpeed(playerScore - 10));
		else return 81;
	}
	else if (playerScore < 200) {
		if (playerScore < 130) return 78;
		else if (playerScore < 180) return (playerScore % 30 == 10) ? (minRiseSpeed - (decrement * floor((playerScore / 30) + 1))) : 
																	  (scr_getRiseSpeed(playerScore - 10));
		else if (playerScore < 190) return 69;
		else return 66;
	}
	else if (playerScore < 300) {
		if (playerScore < 230) return 63;
		else if (playerScore < 250) return 60;
		else if (playerScore < 270) return 57;
		else if (playerScore < 280) return 54;
		else if (playerScore < 290) return 51;
		else return 48;
	}
	else if (playerScore < 400) {
		if (playerScore < 330) return 42;
		else if (playerScore < 350) return 39;
		else if (playerScore < 370) return 36;
		else if (playerScore < 380) return 33;
		else if (playerScore < 390) return 30;
		else return 27;
	}
	else if (playerScore < 500) {
		if (playerScore < 440) return 21;
		else if (playerScore < 470) return 15;
		else if (playerScore < 490) return 9;
		else return 6;
	}
	else return 3;		



}
