if (transition) {
	if (transitionAlpha >= 1) {
		if !(alarm[0]) alarm[0] = 30;	
	} else transitionAlpha += 0.05;
} else {
	if (transitionAlpha > 0) transitionAlpha -= 0.05;
	else transitionAlpha = 0;
}