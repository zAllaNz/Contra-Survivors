var empurrar = 1;
var dir = point_direction(other.x, other.y, x, y);
var hspd = lengthdir_x(empurrar, dir);
var vspd = lengthdir_y(empurrar, dir);

x += hspd;
if (place_meeting(x, y, obj_wall)) {
	x -= hspd;
}

y += vspd;
if (place_meeting(x, y, obj_wall)) {
	y -= vspd;
}