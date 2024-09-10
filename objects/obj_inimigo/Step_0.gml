cooldown++;
if(cooldown >= cooldown_max/4){
	unmove = false;
	image_speed = 1;
}
if(player.pause or unmove){
	exit;
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