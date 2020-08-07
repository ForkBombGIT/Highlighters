creationTime = current_time;

//where the match maker is from
origin = instance_position(x,y,objPar_piece);

//checks color to be matched
colorIndex = -1;

//controls match search
match = 0;
matchSize = 4;
another = true;
final = ds_list_create();
stack = ds_stack_create();
bombs = ds_list_create();
var startingPiece = instance_position(x,y,objPar_piece);
ds_list_add(final,startingPiece);
ds_stack_push(stack,startingPiece);

//controls match animation
listPosition = 0;
highlightDelay = global.gameMode == 1 ? 12 : 4;
fastHighlightDelay = global.gameMode == 1 ? 6 : 1;
flickerDelay = global.gameMode == 1 ? 54 : 30;
postFlickerDelay = global.gameMode == 1 ? 36 : 20;
flickerOffset = 2;
flickerCount = 0;
animating = false;
flicker = false;
postFlicker = false;
highlight = false;
justLandedEntity = noone;;
animationComplete = false;
clearFinalList = false;