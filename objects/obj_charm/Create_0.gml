event_inherited();
//sprite setup
image_speed = 0;
charm_sprites = [spr_charm,spr_charm_2]
miscMap = ds_map_find_value(global.options,"misc");
sprite_index = charm_sprites[ds_map_find_value(miscMap,"charmSkin")];
image_index = -1;
index = -1;
//position
row = -1;