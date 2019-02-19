for (var i = obj_controller.boardHeight - 1; i > 0; i--) {
	if (scr_checkGroundedRow(i)) return i;
}
return -1;