if (transitioning) {
	if (objCtrl_game.ui.alarm[0]) {
		state = nextState;
		nextState = -1;
		transitioning = false;
		cursorPosition = 0;
	}
}