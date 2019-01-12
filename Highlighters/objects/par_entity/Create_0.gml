randomize();
//swapping variables
swap = false;
targetX = -1;
targetY = -1;
swapSpeed = 8;
//controls fall speed
fallPace = 0.5;
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
//delay for deletion on match
matchDelay = 0.2;
matchTimer = -1;
//used for matches
left = noone;
right = noone;
down = noone;
up = noone;
match = false;
matchAnim = false;
imageIndex = 0;