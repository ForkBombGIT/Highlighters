creationTime = current_time;
show_debug_message(creationTime);
//where the match maker is from
origin = instance_position(x,y,par_entity);

//checks color to be matched
colorIndex = -1;

//controls match search
match = 0;
matchSize = 4;
another = true;
final = ds_list_create();
stack = ds_stack_create();
bombs = ds_list_create();
var startingPiece = instance_position(x,y,par_entity);
ds_list_add(final,startingPiece);
ds_stack_push(stack,startingPiece);

//controls match animation
listPosition = 0;
highlightDelay = global.practice ? 12 : 6;
fastHighlightDelay = global.practice ? 6 : 3;
flickerDelay = global.practice ? 72 : 36;
postFlickerDelay = global.practice ? 48 : 24;
flickerOffset = 2;
flickerCount = 0;
animating = false;
flicker = false;
postFlicker = false;
highlight = false;
justLandedEntity = noone;;