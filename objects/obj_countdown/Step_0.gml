var animSpeed = 0.02;
animIndex += animSpeed;
if (floor(animIndex) >= sprite_get_number(spr_countdown)) {
	image_index = 3;
	if !(alarm[0]) alarm[0] = 15;
} else {
	image_index = floor(animIndex);
}

