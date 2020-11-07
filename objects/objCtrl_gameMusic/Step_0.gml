if !(songPlaying) {
	songPlaying = true;
	if (global.character == 3) || (global.character == 1)
		audio_play_sound(songs[global.character],1,1);	
}

if (objCtrl_menuPause.pause) {
	songPaused = true;
	if (global.character == 3) || (global.character == 1)
		audio_pause_sound(songs[global.character]);	
}
else { 
	if (songPaused) {
		if (global.character == 3) || (global.character == 1)
			audio_resume_sound(songs[global.character]);	
		songPaused = false;
	}
}
