event_inherited();

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