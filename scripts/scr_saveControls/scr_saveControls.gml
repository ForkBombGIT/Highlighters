function scr_saveControls(argument0) {
	var fileName = argument0;
	var controlsString = json_encode(global.controls);
	var file = file_text_open_write(fileName);
	file_text_write_string(file,controlsString);
	file_text_close(file);



}
