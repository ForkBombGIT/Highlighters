function scr_matchListSort(argument0, argument1, argument2) {
	var list = argument0;
	var low = argument1;
	var high = argument2;

	//recursive while the lower partition is less than the high partition
	if (low < high) {
		var partitionPoint = scr_partition(list,low,high);	
		scr_matchListSort(list,low,partitionPoint - 1);
		scr_matchListSort(list,partitionPoint + 1,high);
	}

	return list;


}
