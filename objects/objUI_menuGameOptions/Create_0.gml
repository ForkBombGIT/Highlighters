event_inherited();

//sets font to use
numFont = font_add_sprite_ext(spr_menunumbers, "0123456789", true, 3);

//whether or not to start game
start = false;

// Positions for cursor movement
cursorPositions = [168,288];

//cursor control
delayTime = current_time;
delay = 0.05;
cursorFlickerIndex = 0;
cursorType = 0;

//animation
cursorFlickerSpeed = 0.0333