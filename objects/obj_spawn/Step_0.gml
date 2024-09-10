spawn_count++;

if(spawn_count >= spawn_max){
	spawn_count = 0;
	var lado = irandom(1);
	if(lado == 0){
		var xx = irandom_range(global.cam_x, global.cam_x + global.cam_width);
		var yy = choose(global.cam_y - 16, global.cam_y + global.cam_height + 16);
		instance_create_layer(xx, yy, "instances", obj_ant_red);
	}
	else{
		var xx = choose(global.cam_x - 16, global.cam_x + global.cam_width + 16);
		var yy = irandom_range(global.cam_y, global.cam_y + global.cam_height);
		instance_create_layer(xx, yy, "instances", obj_ant_red);
	}
}