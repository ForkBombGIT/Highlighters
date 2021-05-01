if (global.restart) { totalMillis = 0; global.minutes = 0; global.seconds = 0; milli = 0; }

//flickers game level when a combo/chain is required to proceed (gameLevel = x99)
if (global.requiresCombo) && 
   (global.active) {
	levelFlickerIndex += levelFlickerDelay	
	if (floor(levelFlickerIndex) > flickerOnVal) {
		levelFlicker = !levelFlicker;
		levelFlickerIndex = 0;
	}
} 
else { levelFlicker = true; levelFlickerIndex = 0; }

if (global.active) {
	#region Time Counting
	if !(global.gameover) && 
	   !(global.victory) {	
		milli++;
		totalMillis++;
		if (milli >= room_speed) {
			milli = 0; global.seconds = clamp(global.seconds + 1,0, (global.minutes == 99) ? room_speed - 1 :
																							 room_speed);
		} 
		if (global.seconds >= room_speed) {
			if (global.minutes != 99)
				global.seconds = 0; 
			global.minutes = clamp(global.minutes + 1, 0, 99)
		}	
	}
	#endregion
}	
