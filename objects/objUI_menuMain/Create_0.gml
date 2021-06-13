event_inherited();

// start text variables
inputMap = ds_map_find_value(global.options,"input");
upperCase = font_add_sprite_ext(spr_fontAll,"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789`-=*-[]+;'\\,./",true,3);
drawStart = false;
drawStartTimer = current_time;
drawStartDelay = 0.5;
// Animation control
startFlickerIndex = 0;
optionAnimationIndex = 0;
startAnimationSpeed = 2; //fps
optionAnimationSpeed = 12; //fps

menuSection = 0
menuSectionIndex = 0;
menuSectionSpeed = 2;