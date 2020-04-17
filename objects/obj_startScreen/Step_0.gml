#region Menu Animation
var startFlicker = 0.033;
startFlickerIndex += startFlicker;
if (floor(startFlickerIndex) > 1) {
	startFlickerIndex = 0;
} 

var optionAnimation = 0.2;
optionAnimationIndex += optionAnimation;
if (floor(optionAnimationIndex) > 6) {
	optionAnimationIndex = 1;
}  

var optionBackgroundAnimation = 0.2;
optionBackgroundAnimationIndex += optionBackgroundAnimation;
if (floor(optionBackgroundAnimationIndex) >= 32){
	optionBackgroundAnimationIndex = 0;
}  
#endregion

#region Menu Navigation
if (start != 0) {
	//menu item selection
	if !(inputChangeKey) {
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"B"))) {
			if (start == 4) start = 2;
			start--; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}	
	
		if (keyboard_check_pressed(vk_anykey)) {
			//moving up and down
			if (keyboard_key == ds_map_find_value(global.controls,"UP")) 
				cursorPosition = clamp(cursorPosition - 1,0,(start == 2) ? 0 : 
															((start == 3) ? ((option == 0) ? array_length_1d(inputCursorPositions) - 1 : 
															0) : 
															2));
			else if (keyboard_key == ds_map_find_value(global.controls,"DOWN")) 
				cursorPosition = clamp(cursorPosition + 1,0,(start == 2) ? 0 : 
															((start == 3) ? ((option == 0) ? array_length_1d(inputCursorPositions) - 1 : 
															0) : 
															2));
		}
	}
}

switch (start) {
	case 0:
		//menu item selection
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			start = 1; flash = true;
			if !(alarm[0]) alarm[0] = 2;
		}
		break;
	case 1:
		global.practice = false;
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			switch (cursorPosition) {
				case 0: //classic
					start = 5;
				case 1: //practice
					if (start == 1) start = 4; 
					flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
				case 2: //options
					start = 2; flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
			}
		}
		break;
	case 2:
		option = -1;
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			switch (cursorPosition) {
				case 0: //input
					option = 0
				case 1: //audio video
					if (option == -1) option = 1;
					start = 3;
					flash = true;
					if !(alarm[0]) alarm[0] = 2;
					break;
			}
		}
		break;
	case 3:
		// if the user is changing the key
		if (inputChangeKey) {
			if (keyboard_check_pressed(vk_anykey)) {
				   var keyPressed = keyboard_key;
				   // if cursor is not at select
				   if (cursorPosition - 1 >= 0) {
					   //sprite index
					   var index = scr_keyToIndex(keyPressed);
					   var validKey = true;
					   //checks for duplicate keys
					   for (var i = 0; i < array_length_1d(inputControlValues); i++) {
						   if (inputControlValues[i] == index) {
							   validKey = false;
							   break;
						   }
					   }
					   //if valid index
					   if (index != 0) && (validKey) {
						   //set the sprite to the index
						   inputControlValues[cursorPosition - 1] = index;
						   //set the key to the new control
						   switch (cursorPosition - 1) {
							   case 0:
							    ds_map_set(global.controls,"UP",keyPressed);
								break;
							   case 1:
							    ds_map_set(global.controls,"DOWN",keyPressed)
								break;
							   case 2:
							    ds_map_set(global.controls,"LEFT",keyPressed)
								break;
							   case 3:
							    ds_map_set(global.controls,"RIGHT",keyPressed)
								break;
							   case 4:
							    ds_map_set(global.controls,"A",keyPressed)
								break;
							   case 5:
							    ds_map_set(global.controls,"B",keyPressed)
								break;
							   case 6:
							    ds_map_set(global.controls,"PAUSE",keyPressed)
								break;
						   }
					   }
				   }
				
				   inputChangeKey = false;
				   inputPrompt = 0;
				   scr_saveControls("data.json");
			}
		} else {
			//handles key selection
			if (keyboard_check_pressed(vk_anykey)) {
				//resets input prompt if it is set to 1, and the cursor is not at the esc option
				if (inputPrompt == 1)
					inputPrompt = 0;
				// if enter is pressed (key changing key), and not at position 0
				// allow the user to change the key
				if (keyboard_key == vk_enter) && (cursorPosition != 0) {
					if (cursorPosition == array_length_1d(inputCursorPositions) - 1)
						inputPrompt = 1
					else {
						inputChangeKey = true;	
						inputPrompt = 2;
					}
				}	
			}
		}
		break;
	case 4:
		if (keyboard_check_pressed(ds_map_find_value(global.controls,"A"))) {
			start++;
			global.practice = true;
		}
		break;
	case 5:
		instance_create_layer(0,0,"Instances",obj_startGame);
		instance_destroy();
		break;
}
#endregion