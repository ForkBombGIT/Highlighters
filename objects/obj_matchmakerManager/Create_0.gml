seenMatchmakers = ds_list_create();
matchmakers = ds_list_create();
//determines whether a combo has been triggered or not
global.combo = false;
comboSize = 5;
activeComboSize = -1;

//how long freeze is applied for
freezeTime = 0;

// levels accumulated on 99 levels
carryOverLevels = 0;

//scoring
baseScoreInc = 10;
comboBonus = 200;
chainBonus = 500;

//chain variable
global.chain = false;
lastChainCreation = current_time;
framesSinceChain = 0;
chainSize = 0;
chainStart = false;
forceRise = false;
