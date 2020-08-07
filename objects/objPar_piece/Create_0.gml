randomize();
global.pieceSize = 48;

lastGameoverDelay = 0;

//indentify charm color
index = -1;

//swapping variables
swapSpeeds = ds_list_create();
if (global.gameMode == 1) { 
	ds_list_add(swapSpeeds,24);
	ds_list_add(swapSpeeds,18);
	ds_list_add(swapSpeeds,6);
}
else {
	ds_list_add(swapSpeeds,24);
	ds_list_add(swapSpeeds,18);
	ds_list_add(swapSpeeds,6);
}
swap = false;
swapState = 0;
targetX = -1;
swapSpeed = global.gameMode == 1 ? 4 : 16; //48 

//controls fall speed
justLanded = false;
bottomEntity = false;
fallDelay = 1;
inMatchCol = false;

//animation variables
falling = false;
skipDelay = false;
landAnimIndex = image_index;
landAnim = false;
matchNumber = -1;
highlight = false;
highlightDelay = (global.gameMode == 1) ? 2 : 1;
highlightIndex = 8;
highlightLength = 14;
highlighting = false;
bounce = false;
squish = false;
floatDelay = global.gameMode == 1 ? 15 : 10;
aboveMatch = false;
floatAboveMatchDelay = global.gameMode == 1 ? 30 : 3;
landingAnimationFirst = 0.25; // 4 frames
landingAnimationRest = 0.5; // 2 frames

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