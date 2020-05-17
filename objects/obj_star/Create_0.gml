maxIndexProb = power(sprite_get_number(spr_stars),2);
indexProb = irandom_range(0,maxIndexProb);
image_speed = 0;
for (var i = 0; i < sprite_get_number(spr_stars) - 1; i++) {
	if (indexProb >= power(i,2)) && 
	   (indexProb < power(i + 1,2))
		image_index = sprite_get_number(spr_stars) - i;
}