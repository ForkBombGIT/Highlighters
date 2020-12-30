function scr_loadOptions(fileName) {
	var optionString = scr_fileToString(fileName);
	var optionMap;
	if (optionString != "")
		optionMap = json_decode(optionString);
	return optionMap;
}
