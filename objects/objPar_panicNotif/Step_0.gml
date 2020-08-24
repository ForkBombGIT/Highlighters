// Destroy notification on session ending state changes
if (global.restart) ||
   (global.victory) ||
   (global.gameover) {
	instance_destroy();	
}