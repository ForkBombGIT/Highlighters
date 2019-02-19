//visited tiles
match = ds_list_create();
visited = ds_stack_create();
ds_list_add(match,id);
ds_stack_push(visited,id);
//color to be searched for
index = -1;
//grid position;
row = -1;
col = -1;
