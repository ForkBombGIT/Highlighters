function scr_generateColors() {
	var currIndex = 0;
	var selectedEntities = [];
	//two sets of colors that can't be together
	var likeColors = [18,34,82,98,130,146];
	var likeCounter = 0;
	var likeMax = 3;
	var spriteLength = 18;

	while (array_length_1d(selectedEntities) < 5) {
		var index = irandom_range(0,9);
		var like = false;
		var loop = 0;

		if (array_length_1d(selectedEntities) > 0) {
			repeat (array_length_1d(selectedEntities)) {
				if (selectedEntities[loop++] == index) break;
				else {
					if (loop == array_length_1d(selectedEntities)) {
						//check if the selected color is a like color 
						for (var i = 0; i < array_length_1d(likeColors); i++) {
							if ((index * spriteLength) == likeColors[i]) {
								likeCounter++; like = true; break;
							}
						}
						//if there is a like color, check if a like color can be chosen
						if (likeCounter < likeMax) && (like) || !(like)
							selectedEntities[currIndex++] = index;
					}
				}
			}
		}
		else selectedEntities[currIndex++] = index; 
	}

	return selectedEntities;


}
