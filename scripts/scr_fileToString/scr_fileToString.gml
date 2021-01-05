function scr_fileToString(fileName){
	var buffer = buffer_load(fileName);
	var bufferString = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	return bufferString;
}