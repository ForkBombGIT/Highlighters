event_inherited();
//sprite set up
image_speed = 0;
sprite_index = spr_bomb;
spriteLength = 18;
image_index = obj_controller.selectedEntities[irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1)] * spriteLength;
index = image_index;
//holds position of bomb
row = -1;
col = -1;

matchmaker = noone;
matchFound = false;
matchOverride = false
