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

charm_sprites = [spr_charm,spr_charm_2]
bomb_sprites = [spr_bomb,spr_bomb_2,]
miscMap = ds_map_find_value(global.options,"misc");

// pulse animation
pulse = false;
pulseIndex = 0;
pulseStartIndex = 16 
pulseEndIndex = 17
pulseAnimationSpeedStart = pulseStartIndex / 150;
pulseAnimationSpeedEnd = 0.1;
pulseReset = false;
