randomize();
//holds key settings
global.controls = ds_map_create()
if (!file_exists("data.ini")) {
	ds_map_add(global.controls,"A",ord("X"));
	ds_map_add(global.controls,"B",ord("Z"));
	ds_map_add(global.controls,"UP",vk_up);	
	ds_map_add(global.controls,"DOWN",vk_down);	
	ds_map_add(global.controls,"LEFT",vk_left);	
	ds_map_add(global.controls,"RIGHT",vk_right);
	ds_map_add(global.controls,"PAUSE",vk_enter);
	ds_map_add(global.controls,"SELECT",vk_enter);
	ds_map_add(global.controls,"OFF",vk_escape);
}
image_speed = 0.02;
//holds whether the user wants to practice
practice = false;
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
//holds the blocks to be used in the game
selectedEntities = [];
//input menu variables
inputChangeKey = false;
inputCursorPositions = [45,93,129,165,201,237,273,309,355];
inputControlValues = [6,5,4,3,22,23,45,76];
inputPrompt = 0;
