#region Board UI
if !(global.active) {
	characterAnimIndex = 0;
}

//draws board
draw_sprite(spr_board,global.character,0,0);
//draws gui
draw_set_font(global.numFont);
//score
draw_sprite(spr_score,0,360,72);
draw_text((global.gameMode == 1) ? 410 : 380,99,string_replace_all(string_format(global.gameScore,(global.gameMode == 1) ? 4 : 6,0)," ", "0"));
//game level
draw_sprite(spr_speed,0,360,144);
if (global.requiresCombo && levelFlicker) || 
	!(global.requiresCombo)
	draw_text((global.gameMode == 1) ? 455 : 425 ,168,(global.gameMode == 1) ? 
		        "-" : string_replace_all(string_format(global.gameLevel,3,0)," ", "0"));

#endregion