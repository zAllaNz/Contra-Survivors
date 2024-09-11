var select = irandom(1);
if(place_meeting(x,y,obj_wall)){
	global.spawn_control--;
	instance_destroy();
}
else{
	instance_create_layer(x, y, "instances", enemy[select]);
	instance_destroy();
}