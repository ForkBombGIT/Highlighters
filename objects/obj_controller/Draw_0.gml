if (fadeToBlack) && !(alarm[0]) {
	image_speed = 1;
} 
if !(fadeToBlack) || (image_index >= 15) {
	image_speed = 0;
	if (fadeToBlack && image_index >= 15) {
		if !(alarm[1]) alarm[1] = 60;
		image_index = 15;
	}
	else {
		fadeToBlack = false;
		image_index = 0;
	}
}

if (fadeToBlack)
	draw_sprite((global.gameScore >= global.victoryScore) ? spr_fadeToWhite : spr_fadeToBlack,image_index,24,0);
