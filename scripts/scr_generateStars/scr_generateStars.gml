function scr_generateStars(argument0, argument1, argument2) {
	//generate stars
	var stars = ds_list_create();
	var starsGridSize = argument0;
	var starsGridUnitSize = argument1;
	var character = argument2;
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
			var left = instance_position(starX - starsGridUnitSize,starY,obj_star), 
			    right = instance_position(starX + starsGridUnitSize,starY,obj_star), 
				up = instance_position(starX,starY - starsGridUnitSize,obj_star), 
				down = instance_position(starX,starY + starsGridUnitSize,obj_star);
			coordinatesPass = !instance_exists(instance_position(starX,starY,obj_star)) &&
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
			var maxIndexProb = power(sprite_get_number(spr_stars_default),2);
			var indexProb = irandom_range(0,maxIndexProb);
			for (var j = 0; j < sprite_get_number(spr_stars_default) - 1; j++) {
				if (indexProb >= power(j,2)) && 
				   (indexProb < power(j + 1,2)) { 
					var posIndex = sprite_get_number(spr_stars_default) - j; 
					if (ds_list_find_index(stars,posIndex) == -1)
						imageIndex = posIndex;
				}
			}
		}
	
		var star = instance_create_layer(starX,starY,"Stars",obj_star);
		star.sprite_index = star.starSprites[character]
		star.image_index = imageIndex;
		ds_list_add(stars,imageIndex);
	};

	ds_list_destroy(stars);

}
