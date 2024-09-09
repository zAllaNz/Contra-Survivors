player = obj_player;
enemy_damage = 6;
radius = 20;
move_speed = 1;
angle = -1;
hspd = -1;
vspd = -1;
hp_total = 20;
hp = hp_total;
iframe_max = 10;
iframe_on = false;
iframe_count = 0;
count = 0;
count_max = 20;

function enemy_hit(hit){
	if(hit){
		player.hp_decrease(enemy_damage);
	}
}

function enemy_move(){
	angle = point_direction(x, y, player.x, player.y);
	image_angle = angle;
	hspd = lengthdir_x(move_speed, angle);
	vspd = lengthdir_y(move_speed, angle);

	x += hspd;
	if (place_meeting(x, y, obj_wall)) {
	    x -= hspd;
	}

	y += vspd;
	if (place_meeting(x, y, obj_wall)) {
	    y -= vspd;
	}	
}

function flashing(){
	if(hp <= (hp_total / 2)){
		if(count >= count_max){
			count = 0;
			count_max = 20;
		}
		else if(hp <= hp_total / 4){
			count_max /= 1.5;
		}
		if(count >= round(count_max/2)){
			image_blend = c_red;
		}
		else{
			image_blend = c_white;
		}
		count++;
	}
}

function hp_decrease(damage){
	if(!iframe_on){
		hp -= damage;
		iframe_on = true;
		if(hp <= 0){
			instance_destroy();
		}
	}
}
