//animation for countdown
switch (frameState) {
	case -1:
		frameTimer = current_time;
		frameState = 0;	
		image_index = 0;
		break; 
	case 0:
		image_index = 0;
		break;
	case 1:
		if (image_index > 2)
			image_index = 1;
		break;
	case 2:
		if (image_index > 4)
			image_index = 3;
		break;
	case 3:
		if (image_index > 6)
			image_index = 5;
		break;
	case 4:
		if (image_index > 8)
			image_index = 7;
		break;
	case 5:
		instance_destroy();
		break;
}
		
//changes framestate
if ((current_time - frameTimer)/1000 > 1) {
	frameState++;
	frameTimer = current_time;
}