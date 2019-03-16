event_inherited();

//sprite set up
image_speed = 0;
sprite_index = spr_bomb;
image_index = obj_controller.selectedEntities[irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1)] * 11;
index = image_index;
//holds position of bomb
row = -1;
col = -1;

//used for matches
matchTimer = -1;
