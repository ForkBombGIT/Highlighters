randomize();

//state of the game
state = 0;

randomize();

//holds key settings
global.controls = ds_map_create();
if (!file_exists("data.json")) {
	ds_map_add(global.controls,"A",ord("X"));
	ds_map_add(global.controls,"B",ord("Z"));
	ds_map_add(global.controls,"UP",vk_up);	
	ds_map_add(global.controls,"DOWN",vk_down);	
	ds_map_add(global.controls,"LEFT",vk_left);	
	ds_map_add(global.controls,"RIGHT",vk_right);
	ds_map_add(global.controls,"PAUSE",vk_escape);
}
else global.controls = scr_loadControls("data.json");

// Global variable initialization 
global.gameMode = 0;

//flash behavior
flash = false;

//holds the blocks to be used in the game
selectedEntities = [];	

if (state == 0) instance_create_layer(0,0,"GUI",objUI_splash);	

ui = instance_create_layer(x,y,"GUI",objUI_game);

//adds dev tool object
instance_create_layer(x,y,"Controllers",objCtrl_devTools);
