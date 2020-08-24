function scr_keyToIndex(argument0) {
	var key = argument0;
	if (key == vk_enter) return 45;
	if (key == vk_right) return 3;
	if (key == vk_left) return 4;
	if (key == vk_down) return 5;
	if (key == vk_up) return 6;
	if (key == vk_tab) return 58;
	if (key == vk_space) return 8;
	if (key == vk_backspace) return 62;
	if (key == vk_escape) return 76;
#region numpad
	if (key == vk_numpad0) return 2;
	if (key == vk_numpad1) return 12;
	if (key == vk_numpad2) return 11;
	if (key == vk_numpad3) return 10;
	if (key == vk_numpad4) return 28;
	if (key == vk_numpad5) return 27;
	if (key == vk_numpad6) return 26;
	if (key == vk_numpad7) return 44;
	if (key == vk_numpad8) return 43;
	if (key == vk_numpad9) return 42;
	if (key == vk_add) return 41;
	if (key == vk_subtract) return 59;
	if (key == vk_divide) return 61;
	if (key == vk_multiply) return 60;
	if (key == vk_decimal) return 1;
#endregion
#region letters
	if (chr(key) == "A") return 40;
	if (chr(key) == "B") return 19;
	if (chr(key) == "C") return 21;
	if (chr(key) == "D") return 38;
	if (chr(key) == "E") return 55;
	if (chr(key) == "F") return 37;
	if (chr(key) == "G") return 36;
	if (chr(key) == "H") return 35;
	if (chr(key) == "I") return 50;
	if (chr(key) == "J") return 34;
	if (chr(key) == "K") return 33;
	if (chr(key) == "L") return 32;
	if (chr(key) == "M") return 17;
	if (chr(key) == "N") return 18;
	if (chr(key) == "O") return 49;
	if (chr(key) == "P") return 48;
	if (chr(key) == "Q") return 57;
	if (chr(key) == "R") return 54;
	if (chr(key) == "S") return 39;
	if (chr(key) == "T") return 53;
	if (chr(key) == "U") return 51;
	if (chr(key) == "V") return 20;
	if (chr(key) == "W") return 56;
	if (chr(key) == "X") return 22;
	if (chr(key) == "Y") return 52;
	if (chr(key) == "Z") return 23;
#endregion
#region numbers
	if (key == ord("0")) return 65;
	if (key == ord("9")) return 66;
	if (key == ord("8")) return 67;
	if (key == ord("7")) return 68;
	if (key == ord("6")) return 69;
	if (key == ord("5")) return 70;
	if (key == ord("4")) return 71;
	if (key == ord("3")) return 72;
	if (key == ord("2")) return 73;
	if (key == ord("1")) return 74;
#endregion
#region punctuation
	if (key == 191) return 14; // forward slash
	if (key == 190) return 15; // period
	if (key == 188) return 16; // comma
	if (key == 220) return 24; // backslash
	if (key == 222) return 30; // single quote
	if (key == 192) return 75; // back tick
	if (key == 186) return 31; // semi colon
	if (key == 221) return 46; // closing square bracket
	if (key == 219) return 47; // opening square bracket
	if (key == 187) return 63; // equal sign
	if (key == 189) return 64; // dash
#endregion


}
