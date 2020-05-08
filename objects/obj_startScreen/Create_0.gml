randomize();
//creates splash object
if (instance_number(obj_splash) == 0) {
	instance_create_layer(0,0,"Instances",obj_splash);	
}
//holds key settings
global.controls = ds_map_create();
if (!file_exists("data.json")) {
	ds_map_add(global.controls,"A",ord("X"));
	ds_map_add(global.controls,"B",ord("Z"));
	ds_map_add(global.controls,"UP",vk_up);	
	ds_map_add(global.controls,"DOWN",vk_down);	
	ds_map_add(global.controls,"LEFT",vk_left);	
	ds_map_add(global.controls,"RIGHT",vk_right);
	ds_map_add(global.controls,"PAUSE",vk_enter);
	ds_map_add(global.controls,"OFF",vk_escape);
}
else global.controls = scr_loadControls("data.json");
//holds whether the user wants to practice
global.practice = false;
//holds what screen should be show
start = 0;
//holds what option screen should be shown
option = -1;
//flash behavior
flash = false;
//cursor control
cursor = 0;
cursorPositions = [72,120,168,216,264];
delayTime = current_time;
delay = 0.05;
keyPressLength = 0;
longPress = 12;
cursorPosition = 0;
//animation control
startFlickerIndex = 0;
optionAnimationIndex = 0;
optionBackgroundAnimationIndex = 0;
startAnimationSpeed = 2; //fps
optionAnimationSpeed = 12; //fps
optionBackgroundAnimationSpeed = 12; //fps
//holds the blocks to be used in the game
selectedEntities = [];
//input menu variables
inputChangeKey = false;
inputCursorPositions = [45,93,129,165,201,237,273,309,355];
inputControlValues = [scr_keyToIndex(ds_map_find_value(global.controls,"UP")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"DOWN")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"LEFT")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"RIGHT")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"A")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"B")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"PAUSE")),
					  scr_keyToIndex(ds_map_find_value(global.controls,"OFF"))]
inputPrompt = 0;
instance_create_layer(x,y,"Instances",obj_exit);
