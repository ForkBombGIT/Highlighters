draw_sprite((state == 0) ? spr_menu_input : spr_menu_av, 0,0,0);
switch (state) {
	//input menu
	case 0:
		draw_sprite(spr_menu_option_cursor,0,264,inputCursorPositions[cursorPosition]);
		draw_sprite(spr_menu_option_player,0,264,54);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[0],264,99);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[1],264,135);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[2],264,171);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[3],264,207);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[4],264,243);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[5],264,279);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[6],264,315);
		draw_sprite(spr_keys,objCtrl_menuOptions.inputControlValues[7],264,361);
		draw_sprite(spr_menu_option_prompt,inputPrompt,24,408);
		break;
	//av menu
	case 1:
		draw_sprite(spr_keys,0,288,48);
		draw_sprite(spr_keys,0,288,96);
		draw_sprite(spr_keys,0,288,144);
		draw_sprite(spr_keys,0,288,288);
		break;
}