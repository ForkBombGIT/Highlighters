function scr_saveOptions(fileName) {
	var optionString = json_encode(global.options);
	scr_stringToFile(fileName,optionString);
}
