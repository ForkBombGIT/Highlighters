//clear active match list if no matchmakers exist
var inputMap = ds_map_find_value(global.options,"input");
if (instance_number(obj_matchmaker) == 0) {
	ds_list_clear(activeMatches)	
}

#region Game States
if !(scr_checkRow(objCtrl_gameSession.boardHeight - 1)) { 
	canRise = true;	
}

if (global.gameScore >= global.victoryScore) {
	with (objPar_piece) {
		if !(bottomEntity) global.victory = false;	
	}
}

if (global.gameLevel % global.levelToMatch == global.levelToMatch - 1) global.requiresCombo = true;
else global.requiresCombo = false;


//handles restart logic
if (global.restart) {
	selectedEntities = scr_generateColors();
	//set global variables
	global.active = false;
	global.gameScore = 0;
	global.freeze = false;
	global.forceRise = false;
	//reset freeze
	freezeTime = 0;
	freezeTimer = current_time;
	//delete session objects
	ds_list_clear(activeMatches);
	instance_destroy(obj_matchmaker);
	instance_destroy(objPar_piece);
	instance_destroy(obj_cursor);
	instance_destroy(obj_matchmakerManager);
	//recreate new session objects
	cursor = instance_create_layer(x,scr_getRowPos(4),"Cursor",obj_cursor);		
	cursor.visible = false;
	//regenerate stars
	if !(global.gameMode == 1)
		scr_generateStars(starsGridSize,starGridUnitSize);
	scr_initRows(0);
	//reset level
	global.gameLevel = global.startGameLevel;
	global.riseSpeed = scr_getRiseSpeed(global.gameLevel);
	canRise = true;
	instance_create_layer(168, 132,"GUI",objUI_countdown);	
	instance_create_layer(x,y,"Controllers",obj_matchmakerManager);
	global.restart = false;
}

var pieceSwap = false
with (objPar_piece) {
	if (swap) pieceSwap = true;
}

var pieceFalling = false;
with (objPar_piece) {
	if !(bottomEntity) pieceFalling = true;
}
	
global.riseBrake = (instance_exists(obj_matchmaker)) || pieceFalling || pieceSwap

//freeze timer
if (global.freeze) &&
   (global.gameScore < global.victoryScore) &&
   !(global.riseBrake) {
	if ((current_time - freezeTimer) / 1000 > 1) {
		freezeTime--;
		freezeTimer = current_time;
	}
}  

//turn off freeze if countdown is over
if (freezeTime <= 0) {
	global.freeze = false;
}

#endregion

#region Piece Loop
if keyboard_check(ds_map_find_value(inputMap,"B")) && 
  (instance_exists(obj_matchmaker) || instance_exists(objUI_countdown)) {
	global.fastAnim = true;
	alarm[0] = postFastAnim;
} 


if ((global.active) &&	
   !(global.victory) &&
   !(global.gameover)) { 
	if !(global.gameMode == 1) { // disables level progression in practice
		// handles level progression
		if (global.gameLevel < global.maxLevel) {
			global.riseSpeed = scr_getRiseSpeed(global.gameLevel);
		}
	}
	
	// creates new bottom row
	if (!position_meeting(scr_getColPos(0),scr_getRowPos(0)+24,objPar_piece)){
		scr_createRow(-1);
		if !(newRowInc) {
			var panic = scr_checkRow(6);
			global.gameScore = min(global.gameScore + 1 + panic,global.victoryScore);
			if !(global.gameMode == 1)  
				// levelToMatch must be advance with a combo
				if (global.gameLevel % global.levelToMatch != global.levelToMatch - 1)
					global.gameLevel = min(global.gameLevel + 1,global.maxLevel);
				else 
					obj_matchmakerManager.carryOverLevels += 1
			newRowInc = true;
		}
	} else newRowInc = false;
	
	// manual new row
	if (keyboard_check(ds_map_find_value(inputMap,"B")) && 
	  !(global.forceRise) && 
	  !(global.riseBrake)) {
		global.freeze = false;
		freezeTime = 0;
		//checks if piece is gonna rise into game over territory
		if (scr_checkRow(boardHeight)) {
			global.gameover = true;
		}
		else {
			global.forceRise = true;
			freezeTime = 0;
			riseTimer = current_time;
		
			var targY = abs(432 - (instance_position(scr_getColPos(0),432,objPar_piece).y + 24));
			for (var i = 0; i < instance_number(objPar_piece); i++) {
				var instance = instance_find(objPar_piece,i);
				instance.targY = targY;
				instance.initY = instance.y;
				instance.initY = instance.y;
			}
		}
	}
	
	// rising row
	if !(global.freeze) && 
		(canRise) && 
	   !(global.riseBrake) &&
	   !(global.forceRise) {
		if ((current_time - riseTimer)/1000 > (global.riseSpeed / room_speed)) { 
			riseTimer = current_time;
			global.riseUp = true;
		} else global.riseUp = false;
	} else {
		riseTimer = current_time;
		global.riseUp = false;
	}
}
#endregion
