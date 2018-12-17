draw_set_font(numFont);
//time
draw_sprite(spr_time,0,25,50);
draw_text(25,100,string_replace(string_format(minutes,2,0)," ", "0"));
draw_text(25 + sprite_get_width(spr_numbers) * 2.2,100, "'");
draw_text(25 + sprite_get_width(spr_numbers) * 2.8,100,string_replace(string_format(seconds,2,0)," ","0"));
draw_text(25 + sprite_get_width(spr_numbers) * 5.1,100,chr(34));
draw_text(25 + sprite_get_width(spr_numbers) * 6.2,100,string_copy(string_format(milli,2,0),0,2));
//score
draw_sprite(spr_score,0,25,150);
draw_text(25,200,string_replace_all(string_format(obj_controller.gameScore,7,0)," ", "0"));
//next
draw_sprite(spr_next,0,window_get_width() - 42,50);
draw_sprite(spr_nextBox,0,window_get_width() - 95,125);
draw_sprite(spr_bomb,obj_controller.nextBomb, window_get_width() - 95, 125);
//game speed
draw_sprite(spr_speed,0,window_get_width() - 25,200);
draw_text(window_get_width() - 80,250,string_replace_all(string_format(obj_controller.gameSpeed,2,0)," ", "0"));