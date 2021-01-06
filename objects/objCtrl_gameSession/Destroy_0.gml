// object clean up
instance_destroy(obj_matchmakerManager);
instance_destroy(objPar_piece);
instance_destroy(objPar_panicNotif);
instance_destroy(obj_cursor);
if (objCtrl_menuPause.state == 2) 
	instance_destroy(objCtrl_characterPortrait);
instance_destroy(objCtrl_menuPause);
instance_destroy(objCtrl_gameMusic);
instance_destroy(objCtrl_gameAnimation);
instance_destroy(ui);
ds_list_destroy(activeMatches);