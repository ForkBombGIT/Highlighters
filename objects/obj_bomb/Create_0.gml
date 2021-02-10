event_inherited();
//sprite set up
image_speed = 0;
bomb_sprites = [spr_bomb,spr_bomb_2]
miscMap = ds_map_find_value(global.options,"misc");
sprite_index = bomb_sprites[ds_map_find_value(miscMap,"bombSkin")];
spriteLength = 18;
image_index = objCtrl_gameSession.selectedEntities[irandom_range(0,array_length(objCtrl_gameSession.selectedEntities) - 1)] * spriteLength;
index = image_index;
//holds position of bomb
row = -1;
col = -1;

matchmaker = noone;
matchFound = false;
matchOverride = false
