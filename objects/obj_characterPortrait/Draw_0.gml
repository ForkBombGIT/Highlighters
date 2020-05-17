draw_sprite((characterState != 0 || instance_exists(obj_startGame) || instance_exists(obj_countdown)) ? char_other[character] : char_idles[character],floor(characterAnimIndex),360,240);

if (instance_exists(obj_controller)) {
	if (global.freeze) {
		draw_sprite(spr_durma_other,floor(durmaAnimIndex),360,240);			
	}
}
