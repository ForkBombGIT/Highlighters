function scr_generateHistoryFrequency(history) {
    var historyFrequency = ds_map_create();
    for (var i = 0; i < ds_list_size(history); i++) {
		var entity = ds_list_find_value(history,i);
		var pieceFrequency = ds_map_find_value(historyFrequency,entity);
		if (pieceFrequency == undefined) ds_map_add(historyFrequency,entity,1);
		else ds_map_set(historyFrequency,entity,++pieceFrequency);
    }
    return historyFrequency
}