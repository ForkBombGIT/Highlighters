draw_sprite((state != 0 || instance_exists(objCtrl_menuGameOptions) || instance_exists(objUI_countdown)) ? char_other[global.character] : char_idles[global.character],floor(characterAnimIndex),360,240);

if (instance_exists(objCtrl_gameSession)) {
	if (global.freeze) &&
	  !(global.gameover) &&
	  !(global.victory) {
		draw_sprite(spr_durma_other,floor(durmaAnimIndex),360,240);		
		draw_set_font(global.freezeFont);
		draw_text(363,246,string_replace(string_format(objCtrl_gameSession.freezeTime,2,0)," ","0"));
	}
}