function scr_keyToIndex(argument0) {
	var key = argument0;
	if (key == vk_right) return 74;
	if (key == vk_left) return 71;
	if (key == vk_down) return 73;
	if (key == vk_up) return 72;
	if (key == vk_tab) return 19;
	if (key == vk_space) return 69;
	if (key == vk_backspace) return 15;
	if (key == vk_escape) return 1;
	if (key == vk_enter) return 32;
#region numpad
	if (key == vk_numpad0) return 75;
	if (key == vk_numpad1) return 65;
	if (key == vk_numpad2) return 66;
	if (key == vk_numpad3) return 67;
	if (key == vk_numpad4) return 49;
	if (key == vk_numpad5) return 50;
	if (key == vk_numpad6) return 51;
	if (key == vk_numpad7) return 33;
	if (key == vk_numpad8) return 34;
	if (key == vk_numpad9) return 35;
	if (key == vk_add) return 36;
	if (key == vk_subtract) return 18;
	if (key == vk_divide) return 16;
	if (key == vk_multiply) return 17;
	if (key == vk_decimal) return 76;
#endregion
#region letters
	if (chr(key) == "A") return 37;
	if (chr(key) == "B") return 58;
	if (chr(key) == "C") return 56;
	if (chr(key) == "D") return 39;
	if (chr(key) == "E") return 22;
	if (chr(key) == "F") return 40;
	if (chr(key) == "G") return 41;
	if (chr(key) == "H") return 42;
	if (chr(key) == "I") return 27;
	if (chr(key) == "J") return 43;
	if (chr(key) == "K") return 44;
	if (chr(key) == "L") return 45;
	if (chr(key) == "M") return 60;
	if (chr(key) == "N") return 59;
	if (chr(key) == "O") return 28;
	if (chr(key) == "P") return 29;
	if (chr(key) == "Q") return 20;
	if (chr(key) == "R") return 23;
	if (chr(key) == "S") return 38;
	if (chr(key) == "T") return 24;
	if (chr(key) == "U") return 26;
	if (chr(key) == "V") return 58;
	if (chr(key) == "W") return 21;
	if (chr(key) == "X") return 55;
	if (chr(key) == "Y") return 25;
	if (chr(key) == "Z") return 54;
#endregion
#region numbers
	if (key == ord("0")) return 12;
	if (key == ord("9")) return 11;
	if (key == ord("8")) return 10;
	if (key == ord("7")) return 9;
	if (key == ord("6")) return 8;
	if (key == ord("5")) return 7;
	if (key == ord("4")) return 6;
	if (key == ord("3")) return 5;
	if (key == ord("2")) return 4;
	if (key == ord("1")) return 3;
#endregion
#region punctuation
	if (key == 191) return 63; // forward slash
	if (key == 190) return 62; // period
	if (key == 188) return 61; // comma
	if (key == 220) return 48; // backslash
	if (key == 222) return 47; // single quote
	if (key == 192) return 2; // back tick
	if (key == 186) return 46; // semi colon
	if (key == 221) return 31; // closing square bracket
	if (key == 219) return 30; // opening square bracket
	if (key == 187) return 14; // equal sign
	if (key == 189) return 13; // dash
#endregion
	return -1;

}
