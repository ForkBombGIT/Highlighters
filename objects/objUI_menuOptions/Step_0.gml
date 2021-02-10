event_inherited();
// Flickers ready for input menu
if (inputChangeKey) {
	if (((current_time - drawReadyTimer) / 1000) > drawReadyDelay)	{
		drawReady = !drawReady;	
		drawReadyTimer = current_time;
	}
} else {
	drawReady = false;
	drawReadyTimer = current_time - (drawReadyDelay * 1000);
}

// Bomb pulse animation
var animSpeed = pulse ? pulseAnimationSpeedEnd : pulseAnimationSpeedStart;
pulseIndex += animSpeed;
//pulse after the first frame lasts for 9 frames
if (floor(pulseIndex) >= pulseStartIndex) {
	pulse = true;	
}
//pulse animation
if (floor(pulseIndex) == pulseEndIndex) &&
	(pulseReset) {
		pulseIndex = 0;
		pulseReset = false;
		pulse = false;
}
else if (floor(pulseIndex) > pulseEndIndex) {
	//reset pulse animation variables
	if !(pulseReset) {
		pulseIndex = pulseStartIndex;	
		pulseReset = true;
	}
}