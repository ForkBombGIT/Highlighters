function scr_getMatchSpeed(argument0) {
	var playerScore = argument0 - (argument0 % 100);
	var minMatchSpeed = 60;
	var decrement = 10;

	if (playerScore < 600) return minMatchSpeed;
	else return (minMatchSpeed - decrement * ((playerScore % 500)/ 100)); 


}
