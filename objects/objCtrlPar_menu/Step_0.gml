// Reset cursor position on screen change
if instance_exists(objCtrl_game) {
	if (objCtrl_game.ui.flash) {
		cursorPosition = 0;	
	}
}