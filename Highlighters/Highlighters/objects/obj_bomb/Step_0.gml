event_inherited(); 

#region Match Control
if (global.active) {
	if (instance_exists(down)) {
		if (object_get_name(down.object_index) == "obj_piece") {
			if (instance_exists(down.down)) {
				if (object_get_name(down.down.object_index) == "obj_piece") {
					instance_destroy(down.down);
					instance_destroy(down);
					instance_destroy();
				}
			}
		}
	}
}
#endregion