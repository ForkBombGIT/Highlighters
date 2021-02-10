event_inherited();
// Start text flicker
if (state == 0) {
	if (((current_time - drawStartTimer) / 1000) > drawStartDelay) {
		drawStart = !drawStart;	
		drawStartTimer = current_time;
	}
} else {
	drawStart = false;
	drawStartTimer = current_time - (drawStartDelay * 1000);
}

#region Animation
var animSpeed = startAnimationSpeed / room_speed;
startFlickerIndex += animSpeed;
if (floor(startFlickerIndex) > 1) || (objCtrl_game.ui.transitionAlpha != 0) {
	startFlickerIndex = 0;
} 

animSpeed = optionAnimationSpeed / room_speed;
optionAnimationIndex += animSpeed;
if (floor(optionAnimationIndex) > 6) {
	optionAnimationIndex = 1;
}  
#endregion