event_inherited();

randomize();
//holds default options
defaultOptions = ds_map_create();
//holds default input settings
defaultInput = ds_map_create();
ds_map_add(defaultInput,"A",ord("X"));
ds_map_add(defaultInput,"B",ord("Z"));
ds_map_add(defaultInput,"UP",vk_up);	
ds_map_add(defaultInput,"DOWN",vk_down);	
ds_map_add(defaultInput,"LEFT",vk_left);	
ds_map_add(defaultInput,"RIGHT",vk_right);
ds_map_add(defaultInput,"PAUSE",vk_escape)
//holds default audio video controls
defaultAudioVideo = ds_map_create();
ds_map_add(defaultAudioVideo,"musicVol",80);
ds_map_add(defaultAudioVideo,"soundVol",80);
ds_map_add(defaultAudioVideo,"fullscreen",0);
ds_map_add(defaultAudioVideo,"resolution",2);
defaultMisc = ds_map_create();
ds_map_add(defaultMisc,"language",0);
ds_map_add(defaultMisc,"charmSkin",0);
ds_map_add(defaultMisc,"bombSkin",1);
ds_map_add(defaultMisc,"junkSkin",0);
//add default option maps to default option map 
ds_map_add_map(defaultOptions,"input",defaultInput);
ds_map_add_map(defaultOptions,"av",defaultAudioVideo);
ds_map_add_map(defaultOptions,"misc",defaultMisc);
//holds active options
global.optionsFileName = "options.hl"
global.options = ds_map_create();
//if (!file_exists(global.optionsFileName)) {
	//apply default input to options map
	scr_setOptionDefault(defaultOptions,"input");
	//apply default av settings to options map
	scr_setOptionDefault(defaultOptions,"av");
	//apply default av settings to options map
	scr_setOptionDefault(defaultOptions,"misc");
	scr_saveOptions(global.optionsFileName)
//}
//else global.options = scr_loadOptions(global.optionsFileName);

avMap = ds_map_find_value(global.options,"av");
window_set_fullscreen(ds_map_find_value(avMap,"fullscreen"))
if (!ds_map_find_value(avMap,"fullscreen")) {
	var res = scr_getResolution(ds_map_find_value(avMap,"resolution"));
	window_set_size(res[0],res[1]);	
}

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

// audio control
instance_create_layer(x,y,"Controllers",objCtrl_gameAudio);
