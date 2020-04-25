room_goto(1);	
var endGame = instance_create_layer(x,y,"Entities",obj_endGame);
endGame.endState = (global.gameScore >= global.victoryScore);