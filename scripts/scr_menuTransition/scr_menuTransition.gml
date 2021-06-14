function scr_menuTransition(color, alphaChange, hold){
	if (is_undefined(hold)) hold = 30;
	objCtrl_game.ui.transition = true;
	objCtrl_game.ui.transitionColor = color;
	objCtrl_game.ui.alphaChange = alphaChange;
	objCtrl_game.ui.transitionHold = hold;
}