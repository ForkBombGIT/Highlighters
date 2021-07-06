if (text != "") && (array_length(textArray) == 0) {
	for (var i = 0; i < string_length(text); i++) {
		array_push(textArray,{
			value: string_char_at(text,i + 1),
			current : 0, 
			dest : (i % 2 == 0) ? 5 : -5 
			}
		)
	}
}