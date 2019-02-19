x = scr_getColPos(col);
y = scr_getRowPos(row);

//directional variable init
var left = noone,
	right = noone,
	up = noone,
	down = noone;

if (col > 0) left = scr_getPieceAtPos(row,col - 1);
if (instance_exists(left))  
	if (left.index != index) left = noone; 

if (col < obj_controller.boardWidth) right = scr_getPieceAtPos(row,col + 1);
if (instance_exists(right))  
	if (right.index != index) right = noone; 

if (row < obj_controller.boardHeight) up = scr_getPieceAtPos(row + 1,col);
if (instance_exists(up))  
	if (up.index != index) up = noone; 

if (row > 0) down = scr_getPieceAtPos(row - 1,col);
if (instance_exists(down))  
	if (down.index != index) down = noone; 

//traversal
if (instance_exists(left)) { 
	if (ds_list_find_index(match, left.id) == -1) {
		ds_list_add(match,left.id);
		ds_stack_push(visited,left.id);
		col--;
	}
}

else if (instance_exists(right)) {
	if (ds_list_find_index(match, right.id) == -1) {
		ds_list_add(match,right.id);
		ds_stack_push(visited,right.id);
		col++;
	}
}

else if (instance_exists(up)) {
	if (ds_list_find_index(match, up.id) == -1) {
		ds_list_add(match,up.id);
		ds_stack_push(visited,up.id);
		row++;
	}
}

else if (instance_exists(down)) {
	if (ds_list_find_index(match, down.id) == -1) {
		ds_list_add(match,down.id);
		ds_stack_push(visited,down.id);
		row--;
	}
}