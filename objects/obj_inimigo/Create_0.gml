player = obj_player;
enemy_damage = 5 + player.level;
radius = 20;
move_speed = 1 + (player.level / 10);
angle = -1;
hspd = -1;
vspd = -1;
hp_total = 20 + player.level;
hp = hp_total;
iframe_max = 10;
iframe_on = false;
iframe_count = 0;
count = 0;
count_max = 20;
orb_list = [obj_exp_small, obj_exp_medium, obj_exp_high, obj_exp_great];
orb_chance = [60, 25, 10, 5];
efeito_explosion = obj_explosion_enemy;
speed_room = 60;
cooldown = 0;
cooldown_max = 10 * speed_room;
unmove = false;

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

function enemy_bullet(bullet){
	if(bullet){
		if(cooldown >= cooldown_max){
			cooldown = 0;
			unmove = true;
			image_speed = 0;
			var proj = instance_create_layer(x, y, "projetil", obj_bullet_ant);
			proj.image_angle = angle;		
			proj.velocidade = 2;
			proj.radius = 10;
		}
	}
}

function hp_decrease(damage){
	if(!iframe_on){
		hp -= damage;
		iframe_on = true;
		if(hp <= 0){
			selecionar_orb()
			audio_play_sound(sfx_enemy_death, 10, false);
			instance_create_layer(x, y, "instances", efeito_explosion);
			global.spawn_control--;
			instance_destroy();
		}
	}
}

function selecionar_orb() {
    var random_value = irandom(99);
    var acumulado = 0;

    for (var i = 0; i < array_length(orb_chance); i++) {
        acumulado += orb_chance[i];
        if (random_value < acumulado) {
			instance_create_layer(x, y, "lower", orb_list[i]);
			return;
        }
    }
}

function ajustar_chances(level) {
    var aumento = round(level * 1.5);
    orb_chance[0] = max(5, orb_chance[0] - aumento);
    orb_chance[1] = max(10, orb_chance[1] - (aumento / 2));
    orb_chance[2] = min(25, orb_chance[2] + (aumento / 2));
    orb_chance[3] = min(60, orb_chance[3] + aumento);
}
ajustar_chances(player.level);