//generate stars
var stars = ds_list_create();
var starsGridSize = argument0;
var starsGridUnitSize = argument1;
var minStars = 16;
//var maxStars = 24;
var sessionMaxStars = minStars; //irandom_range(minStars,maxStars);
var coordinatesMaxAttempts = 6;

for (var i = 0; i < sessionMaxStars; i++) {
	var coordinatesPass = false;
	var coordinatesAttempts = 0;
	var starX, starY;
	while (!coordinatesPass) {
		starX = irandom_range(0,starsGridSize - 1) * starsGridUnitSize + starsGridUnitSize;
		starY = irandom_range(0,starsGridSize - 1) * starsGridUnitSize + starsGridUnitSize;
		var left = instance_position(starX - starsGridUnitSize,starY,objUI_star), 
		    right = instance_position(starX + starsGridUnitSize,starY,objUI_star), 
			up = instance_position(starX,starY - starsGridUnitSize,objUI_star), 
			down = instance_position(starX,starY + starsGridUnitSize,objUI_star);
		coordinatesPass = !instance_exists(instance_position(starX,starY,objUI_star)) &&
						  !instance_exists(left) &&
						  !instance_exists(right) &&
						  !instance_exists(up) &&
						  !instance_exists(down);
		
		if (ds_list_size(stars) > minStars)
			if (coordinatesAttempts++ > coordinatesMaxAttempts) break;
	}
	if (!coordinatesPass) break;
	
	
	var imageIndex = -1;
	while (imageIndex == -1) {
		var maxIndexProb = power(sprite_get_number(spr_stars),2);
		var indexProb = irandom_range(0,maxIndexProb);
		for (var j = 0; j < sprite_get_number(spr_stars) - 1; j++) {
			if (indexProb >= power(j,2)) && 
			   (indexProb < power(j + 1,2)) { 
				var posIndex = sprite_get_number(spr_stars) - j; 
				if (ds_list_find_index(stars,posIndex) == -1)
					imageIndex = posIndex;
			}
		}
	}
	
	var star = instance_create_layer(starX,starY,"Stars",objUI_star);
	star.image_index = imageIndex;
	ds_list_add(stars,imageIndex);
};