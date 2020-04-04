randomize();
pieceSize = 48;

//indentify charm color
index = -1;

//swapping variables
swap = false;
targetX = -1;
swapSpeed = global.practice ? 4 : 16; //48 

//controls fall speed
bottomEntity = false;
fallCheckDelay = global.practice ? 40 : 10; //alarm speed
fallDelay = 1;

//animation variables
falling = false;
landAnimIndex = image_index;
landAnim = false;
highlight = false;
highlightDelay = 2;
highlightIndex = 8;
highlightLength = 14;
highlighting = false;
bounce = false;
floating = false;
floatDelay = global.practice ? 40 : 30;

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