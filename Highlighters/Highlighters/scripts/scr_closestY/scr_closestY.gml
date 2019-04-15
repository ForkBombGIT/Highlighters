var result = noone;
var disty = -1;

var yvalue = argument0;
var object = argument1;

with (object) {
    if ((result == noone) || (abs(y - yvalue) < disty)) {
        result = id;
        disty = abs(y - yvalue);
    }
}

return result;