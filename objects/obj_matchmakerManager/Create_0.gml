seenMatchmakers = ds_list_create();
matchmakers = ds_list_create();

//determines whether a combo has been triggered or not
global.combo = false;
comboSize = 5;
activeComboSize = -1;

//how long freeze is applied for
freezeTime = 0;

//scoring
baseScoreInc = 10;
comboBonus = 50;
chainBonus = 100;

//chain variable
global.chain = false;
chainSize = 0;
chainStart = false;