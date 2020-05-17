//generate stars
stars = ds_list_create();
starsGridSize = argument0;
starsGridUnitSize = argument1;
starsGridArea = power(starsGridSize,2);
sessionMinStars = 15;
sessionMaxStars = irandom_range(sessionMinStars,floor(starsGridArea / 2.5));

var coordinatesAttempts = 0;
var coordinatesMaxAttempts = 6;
for (var i = 0; i < sessionMaxStars; i++) {
	var coordinatesPass = false;
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
		
		if (ds_list_size(stars) > sessionMinStars)
			if (sessionMaxStars > starsGridArea / 4)
				if (coordinatesAttempts++ > coordinatesMaxAttempts) break;
	}
	if (!coordinatesPass) break;
	var star = instance_create_layer(starX,starY,"Stars",obj_star);
	ds_list_add(stars,star);
}
return stars;