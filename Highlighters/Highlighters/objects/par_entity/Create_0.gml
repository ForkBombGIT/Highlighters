randomize();
index = -1;
//swapping variables
swap = false;
targetX = -1;
swapSpeed = 12;
//controls fall speed
bottomEntity = false;
fallDelay = 6;
//animation variables
landAnimIndex = image_index;
landAnim = false;
//position
row = -1;
col = -1;
//used for matches
left = noone;
right = noone;
down = noone;
up = noone;
adjacent = ds_list_create();
match = false;