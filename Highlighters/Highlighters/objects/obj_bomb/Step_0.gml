event_inherited(); 

#region Match Control
if (global.active) {
	if (instance_exists(left)) {
		if (object_get_name(left.object_index) == "obj_piece") {
			if (instance_exists(left.left)) {
				if (object_get_name(left.left.object_index) == "obj_piece") {
					instance_destroy(left.left);
					instance_destroy(left);
					instance_destroy();
				}
			}
		}
	}
}
#endregion