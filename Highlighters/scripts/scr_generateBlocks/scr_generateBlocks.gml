var currIndex = 0;
var selectedEntities = [];
while (array_length_1d(selectedEntities) < 4) {
	var index = irandom_range(0,9);
	var loop = 0;
	if (array_length_1d(selectedEntities) > 0) {
		repeat (array_length_1d(selectedEntities)) {
			if (selectedEntities[loop++] == index) break;
			else {
				if (loop == array_length_1d(selectedEntities))
					selectedEntities[currIndex++] = index;
			}
		}
	}
	else selectedEntities[currIndex++] = index; 
}
return selectedEntities;