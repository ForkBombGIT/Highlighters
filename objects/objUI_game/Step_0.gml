if (transition) {
	if (transitionAlpha >= 1) {
		if !(alarm[0]) alarm[0] = 30;	
	} else transitionAlpha += alphaChange;
} else {
	if (transitionAlpha > 0) transitionAlpha -= alphaChange;
	else transitionAlpha = 0;
}