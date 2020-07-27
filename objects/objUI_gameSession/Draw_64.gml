//time
draw_set_font(global.timeFont);
draw_text(369,369,string_replace(string_format(global.minutes,2,0)," ", "0"));
draw_text(414,369,string_replace(string_format(global.seconds,2,0)," ","0"));

if (flash) draw_rectangle(0,0,768,432,c_black);