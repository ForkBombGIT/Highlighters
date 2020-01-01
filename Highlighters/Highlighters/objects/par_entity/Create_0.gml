randomize();
pieceSize = 48;
//indentify charm color
index = -1;
//swapping variables
swap = false;
targetX = -1;
swapSpeed = 12;
//controls fall speed
bottomEntity = false;
fallCheckDelay = 6;
fallDelay = 1;
//animation variables
falling = false;
landAnimIndex = image_index;
landAnim = false;
highlight = false;
highlightDelay = 1.65;
highlightIndex = 8;
highlightLength = 14;
highlighting = false;
//position
row = -1;
col = -1;
targY = -1;
initY = -1;
//used for matches
left = noone;
right = noone;
down = noone;
up = noone;
adjacent = ds_list_create();
match = false;