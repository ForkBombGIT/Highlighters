//time
if (objCtrl_game.ui.transitionAlpha == 0) {
	draw_set_font(global.timeFont);
	scr_renderText(global.timeFont,string_replace(string_format(global.minutes,2,0)," ", "0"),378,369,18);
	scr_renderText(global.timeFont,string_replace(string_format(global.seconds,2,0)," ", "0"),423,369,18);
}