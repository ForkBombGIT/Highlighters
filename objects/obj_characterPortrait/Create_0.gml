char_idles = [spr_durma_idle,spr_floss_idle,spr_cognac_idle];
char_other = [spr_durma_other,spr_floss_other,spr_cognac_other];
characterAnimIndex = 0;
characterState = 0;
character = 1;

//animation data for character sprites
characterFrameRates = ds_list_create();
ds_list_add(characterFrameRates,[4,6,3,2]);
ds_list_add(characterFrameRates,[12,4,12,3]);
ds_list_add(characterFrameRates,[6,3,3,2]);