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