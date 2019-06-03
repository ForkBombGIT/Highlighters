/// collision_line_first(x1,y1,x2,y2,object,prec,notme)
//
//  Returns the instance id of an object colliding with a given line and
//  closest to the first point, or noone if no instance found.
//  The solution is found in log2(range) collision checks.
//
//      x1,y2       first point on collision line, real
//      x2,y2       second point on collision line, real
//      object      which objects to look for (or all), real
//      prec        if true, use precise collision checking, bool
//      notme       if true, ignore the calling instance, bool
//
/// GMLscripts.com/license
{
    var x1,y1,x2,y2,object,prec,notme,sx,sy,inst,i;
    x1 = argument0; y1 = argument1; x2 = argument2; y2 = argument3;
    object = argument4;
    prec = argument5;
    notme = argument6;
    sx = x2 - x1;
    sy = y2 - y1;
    inst = collision_line(x1,y1,x2,y2,object,prec,notme);
    if (inst != noone) {
        while ((abs(sx) >= 1) || (abs(sy) >= 1)) {
            sx /= 2;
            sy /= 2;
            i = collision_line(x1,y1,x2,y2,object,prec,notme);
            if (i) {
                x2 -= sx;
                y2 -= sy;
                inst = i;
            } else {
                x2 += sx;
                y2 += sy;
            }
        }
    }
    return inst;
}