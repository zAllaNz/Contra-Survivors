event_inherited();

var enemy = collision_circle(x, y, radius, obj_player, false, false);
if(enemy != noone){
	var dano = 10 + (obj_player.level * 2);
	enemy.hp_decrease(dano);
	instance_create_layer(x, y, "projetil", obj_bullet_effect);
	instance_destroy();
}