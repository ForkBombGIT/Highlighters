var avMap = ds_map_find_value(global.options,"av");
var musicVol = ds_map_find_value(avMap,"musicVol") / 600;
if !(songPlaying) {
	if !(instance_exists(objUI_countdown)) {
		songPlaying = true;
		if (global.character == 3) || (global.character == 1) || (global.character == 4) {
			audio_play_sound(songs[global.character],1,1);
			audio_sound_gain(songs[global.character],musicVol,0);
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
			audio_stop_sound(songs[global.character]);	
			songPlaying = false;
		}
		else if (global.character == 3) || (global.character == 1) || (global.character == 4)  {
			audio_resume_sound(songs[global.character]);	
			audio_sound_gain(songs[global.character],musicVol,0);
		}
		songPaused = false;
	}
}
