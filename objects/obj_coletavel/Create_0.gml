// Referenciando o player para acessar seus métodos.
player_instance = instance_find(obj_player, 0);
xp = 0;
move = false;
vel = 4;

function item_move(){
	if(move){
		// Pegar posição do player
		var dir = point_direction(x, y, obj_player.x, obj_player.y);
		// Movimentar o objeto na direção do player
		x += lengthdir_x(vel, dir);
		y += lengthdir_y(vel, dir);
	}
}

function collect_xp(){
	if(place_meeting(x, y, obj_player)){
		player_instance.increase_xp(xp);
		player_instance.level_up();
		instance_destroy();
	}
}