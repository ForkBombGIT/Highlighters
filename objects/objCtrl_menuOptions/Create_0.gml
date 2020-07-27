event_inherited();

ui = instance_create_layer(x,y,"GUI",objUI_menuOptions);

inputPrompt = 0;
inputChangeKey = false;
inputControlValues = [scr_keyToIndex(ds_map_find_value(global.controls,"UP")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"DOWN")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"LEFT")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"RIGHT")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"A")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"B")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"PAUSE")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"OFF"))]