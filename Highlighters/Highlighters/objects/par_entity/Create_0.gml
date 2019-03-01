randomize();
index = -1;
//swapping variables
swap = false;
targetX = -1;
targetY = -1;
swapSpeed = 8;
//controls fall speed
orgFallPace = 1;
fallPace = orgFallPace;
hardDrop = 0;
preLandFrame = image_index;
landAnimTimer = current_time;
landAnimDelay = 0.04;
landAnim = false;
//row moving 
timer = current_time;
dropTimer = current_time;
moveUp = false;
//position
row = -1;
col = -1;
grounded = false;
//delay for deletion on match
matchDelay = 0.25;
matchTimer = -1;
//used for matches
left = noone;
right = noone;
down = noone;
up = noone;
match = false;
matchAnim = false;
imageIndex = 0;