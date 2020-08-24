// Bomb pulsing 
global.pulse = false;
pulseIndex = 0;
pulseStartIndex = 16 
pulseEndIndex = 17
pulseAnimationSpeedStart = pulseStartIndex / 150;
pulseAnimationSpeedEnd = 0.1;
pulseReset = false;

// Panic notification bounce
bounce = false;
bounceIndex = 0;
bounceAnimationFirst = 0.25; //4 frames
bounceAnimationLast = 0.5; // 2 frames 

// Fade to black on game end
gameEndTransition = false;
gameEndTransitionIndex = 0;
gameEndTransitionEndIndex = 15;
gameEndAnimation = false;
animRow = 8;

ui = instance_create_layer(x,y,"GUI",objUI_gameAnimation);