event_inherited(); 

//Menu option animation
var animSpeed = optionSpeed / room_speed;
endOptionAnim += animSpeed;
if (floor(endOptionAnim) > 6) {
	endOptionAnim = 1;
} 

animSpeed = gameoverSpeed / room_speed;
gameoverAnim += animSpeed;
if (floor(gameoverAnim) > 15) && !(stopGameoverAnim){
	stopGameoverAnim = false;
	gameoverAnim = 15;
} 

if (restart) {
	instance_create_layer(x,y,"Entities",objCtrl_gameSession);	
	instance_create_layer(168,window_get_height()/4,"GUI",objUI_countdown);
	instance_destroy();
}