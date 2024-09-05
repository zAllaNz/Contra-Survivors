image_angle = obj_player.image_angle;
velocidade = 5;
speed_x = lengthdir_x(velocidade, image_angle);
speed_y = lengthdir_y(velocidade, image_angle);

function move_bullet(){
	x += speed_x;
	y += speed_y;
}

function collision_wall_bullet(){
	if(place_meeting(x, y, obj_wall)){
		instance_create_layer(x, y, "instances", obj_bullet_effect);
		instance_destroy();
	}
}

function animation_end(image_index, image_number){
	if (image_index >= image_number - 1) {
	    instance_destroy();
	}
}

function destroy_outside_bullet(x, y){
	if(scr_outside_camera(x, y)){
		instance_destroy();
	}
}
