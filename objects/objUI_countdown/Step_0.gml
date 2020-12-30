var animSpeed = (global.fastAnim) ? fastCount / room_speed : slowCount / room_speed;
var avMap = ds_map_find_value(global.options,"av");
var soundVol = ds_map_find_value(avMap,"soundVol") / 100;
if (floor(animIndex) > sprite_get_number(spr_countdown) - 1) {
	audio_play_sound(snd_countdownb,1,0);
	audio_sound_gain(snd_countdownb,soundVol,0);
	instance_destroy();
} else {
	image_index = floor(animIndex);
}

if (animIndex >= 1) && 
   (lastIndex != floor(animIndex)) && 
   (animIndex <= sprite_get_number(spr_countdown)) {
	audio_play_sound(snd_countdowna,1,0);
	audio_sound_gain(snd_countdowna,soundVol,0);
	lastIndex = floor(animIndex);
} 
animIndex += animSpeed;


