event_inherited();

#region Animation Control
animSpeed = optionBackgroundAnimationSpeed / room_speed;
optionBackgroundAnimationIndex += animSpeed;
if (floor(optionBackgroundAnimationIndex) > 31){
	optionBackgroundAnimationIndex = 0;
}
#endregion
