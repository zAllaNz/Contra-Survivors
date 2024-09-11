event_inherited();
enemy_damage_explosion = 10 + (player.level * 3);
move_speed = 3 + (player.level / 5);
hp_total = 10 + (player.level * 2);
hp = hp_total;
function enemy_hit(hit){
	if(hit){
		player.hp_decrease(enemy_damage_explosion);
		instance_create_layer(x, y, "instances", obj_explosion_enemy);
		instance_destroy();
	}
}
