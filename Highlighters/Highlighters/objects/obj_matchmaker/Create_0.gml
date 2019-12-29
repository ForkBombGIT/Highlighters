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
ds_list_add(final,instance_position(x,y,par_entity));
ds_stack_push(stack,instance_position(x,y,par_entity));
//controls match animation
listPosition = 0;
highlightDelay = 6;
whiteDelay = 24;
postWhiteDelay = 42;
flickerDelay = 2;
flickerCount = 0;
animating = false;
flicker = false;
postWhite = false;
//scoring
comboSize = 0;
baseScoreInc = 10;
comboBonus = 50;