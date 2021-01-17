if (audio_group_is_loaded(ag_music)) {
	if (instance_exists(objCtrl_gameSession)) {
		if !(songPlaying) {
			if !(instance_exists(objUI_countdown)) {
				if !(audio_is_playing(snd_countdownb)) {
					songPlaying = true;
					if (global.character == 3) || (global.character == 1) || (global.character == 4) {
						audio_play_sound(songs[global.character],1,1);
					}	
				}
			}
		}

		if (objCtrl_menuPause.pause) {
			songPaused = true;
			if (global.character == 3) || (global.character == 1) || (global.character == 4) 
				audio_pause_sound(songs[global.character]);	
		}
		else { 
			if (songPaused) {
				if (instance_exists(objUI_countdown)) || (global.restart) {
					if !(audio_is_playing(snd_countdownb)) {
						if (global.character == 3) || (global.character == 1) || (global.character == 4)
							audio_stop_sound(songs[global.character]);	
						songPlaying = false;
					}
				}
				else if (global.character == 3) || (global.character == 1) || (global.character == 4)  {
					audio_resume_sound(songs[global.character]);	
				}
				songPaused = false;
			}
		}
	}
}
