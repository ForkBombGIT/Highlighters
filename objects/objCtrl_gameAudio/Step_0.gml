if (audio_group_is_loaded(ag_music)) {
	if (instance_exists(objCtrl_gameSession)) {
		// Start music if no music is playing, and countdown is gone
		if !(songPlaying) {
			if !(instance_exists(objUI_countdown)) {
				if !(audio_is_playing(snd_countdownb)) {
					songPlaying = true;
					audio_play_sound(songs[global.character],1,1);
				
				}
			}
		}
		// Pause music on pause menu
		if (objCtrl_menuPause.pause) {
			songPaused = true;
			audio_pause_sound(songs[global.character]);	
		}
		else { 
			// Stop music on game end
			if (objCtrl_gameAnimation.gameEndAnimation) {
					audio_stop_sound(songs[global.character]);	
				songPlaying = false;
			}
			if (songPaused) {
				// Stop song on puase menu restart/quit
				if (instance_exists(objUI_countdown)) || (global.restart) {
					if !(audio_is_playing(snd_countdownb)) {
						audio_stop_sound(songs[global.character]);	
						songPlaying = false;
					}
				}
				// Resume song on pause menu resume
				audio_resume_sound(songs[global.character]);	
				songPaused = false;
			}
		}
	}
}
