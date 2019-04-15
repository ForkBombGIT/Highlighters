event_inherited(); 

#region Match Control
//checks for adjacent matching pieces
left = instance_position(x - 48, y, par_entity);
if (instance_exists(left)) 
	if ((left.image_index != image_index) || (left == id))
		left = noone;
		
right = instance_position(x + 48, y, par_entity);
if (instance_exists(right)) 
	if ((right.image_index != image_index) || (right == id))
		right = noone;
		
down = instance_position(x, y + 48, par_entity);
if (instance_exists(down)) 
	if ((down.image_index != image_index) || (down == id))
		down = noone;

up = instance_position(x, y - 48, par_entity);
if (instance_exists(up)) 
	if ((up.image_index != image_index) || (up == id))
		up = noone;
#endregion