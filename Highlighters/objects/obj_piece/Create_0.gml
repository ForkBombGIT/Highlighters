event_inherited();
//sprite setup
image_speed = 0;
sprite_index = spr_piece;
image_index = obj_controller.selectedEntities[irandom_range(0,array_length_1d(obj_controller.selectedEntities) - 1)];
//position
row = 0;