var list = argument0;
var low = argument1;
var high = argument2;

//list will be modified around this pivot
var pivot = ds_list_find_value(list,high);
pivot.match = true;
var index = low - 1;
//movves smaller elements below pivot position
for (var i = low; i < high; i++) {
	var positionEntity = ds_list_find_value(list,i);
	positionEntity.match = true; //used to enforce that all pieces have match set to true
	if (positionEntity.y == pivot.y)  {
		if (positionEntity.x < pivot.x) {
			index++;
			var temp = ds_list_find_value(list,index);
			ds_list_set(list,index,positionEntity);
			ds_list_set(list,i,temp);
		}
	} else if (positionEntity.y < pivot.y){
		index++;
		var temp = ds_list_find_value(list,index);
		ds_list_set(list,index,positionEntity);
		ds_list_set(list,i,temp);	
	}
}

//moves pivot to high position
var temp = ds_list_find_value(list,index + 1);
ds_list_set(list,index + 1,ds_list_find_value(list,high));
ds_list_set(list,high,temp);

return index + 1;