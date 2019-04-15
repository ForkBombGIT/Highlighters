var yAxis = argument0;
var objectToCheck = argument1;
var closestObj = noone;
var distanceY = -1;

with (objectToCheck) {
    if ((closestObj == noone) || (abs(y - yAxis) < distanceY)) {
        closestObj = id;
        distanceY = abs(y - yAxis);
    }
}

return closestObj;