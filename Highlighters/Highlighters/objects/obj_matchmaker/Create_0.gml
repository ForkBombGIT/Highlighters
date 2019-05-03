//checks color to be matched
colorIndex = -1;
//controls match search
another = true;
final = ds_list_create();
stack = ds_stack_create();
ds_list_add(final,instance_position(x,y,par_entity));
ds_stack_push(stack,instance_position(x,y,par_entity));