function scr_stringToFile(fileName,bufferString){
	var buffer = buffer_create(string_byte_length(bufferString) + 1, buffer_fixed, 1);
	buffer_write(buffer,buffer_string,bufferString);
	buffer_save(buffer,fileName);
	buffer_delete(buffer);
}