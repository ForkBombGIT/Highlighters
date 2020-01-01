var fileName = argument0;
var file = file_text_open_read(fileName);
var controlsString = file_text_read_string(file);
show_debug_message(controlsString);
var controlsMap;
if (controlsString != "")
	controlsMap = json_decode(controlsString);
file_text_close(file);
return controlsMap;