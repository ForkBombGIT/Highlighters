milli = current_time - offset
if (milli >= 1000) {offset += 1000; seconds += 1;} 
if (seconds >= 60) {seconds = 0; minutes += 1;}	
