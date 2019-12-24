randomize();
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
//holds a and b control keys
keyA = ord("X");
keyB = ord("Z");
keySelect = vk_enter;
keyUp = vk_up;
keyDown = vk_down;
keyLeft = vk_left;
keyRight = vk_right;
keyPause = vk_enter;
keyOff = vk_escape;
//input menu variables
inputChangeKey = false;
inputCursorPositions = [45,93,129,165,201,237,273,309,355];
inputControlValues = [6,5,4,3,22,23,45,76];
inputPrompt = 0;
