if(player.pause){
	exit;
}

spawn_count++;
if(spawn_count >= spawn_max and global.spawn_control <= 150){
	spawn_count = 0 
	for(var i = 0; i <= player.level + 1; i++){
		global.spawn_control++;
		var lado = irandom(1);
		if(lado == 0){
			var xx = irandom_range(global.cam_x, global.cam_x + global.cam_width);
			var yy = choose(global.cam_y - 16, global.cam_y + global.cam_height + 16);
			instance_create_layer(xx, yy, "instances", obj_teste_spawn);
		}
		else{
			var xx = choose(global.cam_x - 16, global.cam_x + global.cam_width + 16);
			var yy = irandom_range(global.cam_y, global.cam_y + global.cam_height);
			instance_create_layer(xx, yy, "instances", obj_teste_spawn);
		}
	}
}