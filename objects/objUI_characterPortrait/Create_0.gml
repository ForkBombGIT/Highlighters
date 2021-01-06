global.freezeFont = font_add_sprite_ext(spr_freezenumbers, "0123456789", true, 3); 

char_idles = [spr_durma_idle,spr_floss_idle,spr_cognac_idle,spr_hasen_idle,spr_milo_idle];
char_other = [spr_durma_other,spr_floss_other,spr_cognac_other,spr_hasen_other,spr_milo_other];
characterAnimIndex = 0;
durmaAnimIndex = 7;
state = 0;
lastState = 0;
lastFreezeTime = -1;

visible = (global.gameMode == 1) ? false : true;

//animation data for character sprites
characterFrameRates = ds_list_create();
ds_list_add(characterFrameRates,[4,6,3,2]);
ds_list_add(characterFrameRates,[12,4,12,3]);
ds_list_add(characterFrameRates,[6,3,3,2]);
ds_list_add(characterFrameRates,[10,2,4,2]);
ds_list_add(characterFrameRates,[12,6,4,12]);
show_debug_message(ds_list_size(characterFrameRates));