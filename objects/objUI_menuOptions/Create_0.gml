event_inherited();
state = -1;
// Input Options 
drawReady = false;
drawReadyTimer = current_time;
drawReadyDelay = 0.5;
inputPrompt = -1;
inputChangeKey = false;
numFont = font_add_sprite_ext(spr_optionnumbers, "0123456789", true, 3);
numFontFaded = font_add_sprite_ext(spr_optionnumbers_faded, "0123456789", true, 3);