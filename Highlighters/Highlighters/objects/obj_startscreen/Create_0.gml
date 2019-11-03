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