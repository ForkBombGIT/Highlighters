var animSpeed = (global.fastAnim) ? fastCount / room_speed : slowCount / room_speed;
animIndex += animSpeed;
if (floor(animIndex) >= sprite_get_number(spr_countdown) - 1) {
	image_index = 3;
	if !(alarm[0]) alarm[0] = (global.fastAnim) ? fastCount : room_speed;
} else {
	image_index = floor(animIndex);
}

