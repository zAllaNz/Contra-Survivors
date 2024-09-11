if(player.pause){
	exit;
}
cooldown++;

if(cooldown >= cooldown_max/4 and unmove){
	unmove = false;
	move_speed = 1 + (player.level / 10);
	image_speed = 1;
}
else if(cooldown <= cooldown_max/4 and unmove){
	image_speed = 0;
	move_speed = 0;
}

var hit = collision_circle(x, y, radius, obj_player, false, false);
enemy_hit(hit);
enemy_move();
flashing();

if(iframe_on){
	iframe_count++;
	if(iframe_count >= iframe_max){
		iframe_count = 0;
		iframe_on = false;
		image_blend = c_white;
	}
	else{
		image_blend = c_yellow;
	}
}