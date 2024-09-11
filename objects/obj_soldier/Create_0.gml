event_inherited();
cooldown_max = 5 * speed_room;
function enemy_bullet(bullet){
	if(bullet){
		if(cooldown >= cooldown_max){
			cooldown = 0;
			unmove = true;
			image_speed = 0;
			var ponta_arma_x = x + lengthdir_x(32, image_angle) - lengthdir_y(-15, image_angle);
			var ponta_arma_y = y + lengthdir_y(32, image_angle) + lengthdir_x(-15, image_angle);
			var proj = instance_create_layer(ponta_arma_x, ponta_arma_y, "projetil", obj_bullet_ant);
			proj.image_angle = angle;
			proj.image_xscale = 0.5;
			proj.image_yscale = 0.5;
			proj.velocidade = 4;
			proj.radius = 10;
		}
	}
}