// Atributos do personagem
move_speed = 4;
armor = 3;
hp = 20;
fire_rate = 20;
damage = 5;
iframe_max = 60;
iframe_on = false;
iframe_count = 0;

hp_atual = hp;
x_arma = 28;
y_arma = 9;
state = character_state.idle;
time_since_last_shot = 0;
xp = 0;
level = 0;
xp_to_levelup = 30;
collect_radius = 50;
pause = false;
teste = false; 

count_death = 200;
count_aux = 0;

regen_timer = 15 * 60;
regen_count = 0;
regen = 1;


enum character_state{
	idle, walk, death
}


function move_e_colide(move_speed, move_x, move_y){
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	// Normaliza o movimento para garantir a mesma velocidade em todas as direções
	if (move_x != 0 or move_y != 0) {
	    var move_len = sqrt(move_x * move_x + move_y * move_y);
	    move_x /= move_len;
	    move_y /= move_len;
	}

	// Multiplica pelo valor da velocidade
	move_x *= move_speed;
	move_y *= move_speed;

	// Move horizontalmente e verifica colisão
	if (place_meeting(x + move_x, y, obj_wall)) {
	    while (!place_meeting(x + sign(move_x), y, obj_wall)) {
	        x += sign(move_x);
	    }
	    move_x = 0;
	}
	x += move_x;

	// Move verticalmente e verifica colisão
	if (place_meeting(x, y + move_y, obj_wall)) {
	    while (!place_meeting(x, y + sign(move_y), obj_wall)) {
	        y += sign(move_y);
	    }
	    move_y = 0;
	}
	y += move_y;
}

function inverter_imagem_y()
{
	image_yscale *= -1;
}

function increase_xp(qntd_xp){
	xp += qntd_xp;
}

function increase_level(){
	level++;
}

function set_xp_to_levelup(){
	xp = 0;
	xp_to_levelup *= 1.5;
	xp_to_levelup = round(xp_to_levelup);
}

function level_up(){
	if(xp >= xp_to_levelup){
		increase_level();
		set_xp_to_levelup();
		upgrade();
	}
}

function upgrade(){
	scr_switch_pause();
}

/// @func speed_up(),
/// @desc Esta função aumenta a velocidade do player. Altera diretamente o atributo do objeto player.
function speed_up(){
	move_speed += move_speed * 0.1;
}

function hp_up(){
	hp += 5;
}

function hp_decrease(damage){
	var aux = (armor - damage)
	if(hp_atual > 0){
		if(aux < 0 and !iframe_on){
			hp_atual += aux;
			hp_zero();
		}
		iframe_on = true;
	}
}

function hp_regen(){
	regen_count++;
	if(regen_count >= regen_timer){
		regen_count = 0;
		if(hp_atual <= hp){
			if((hp_atual + regen) <= hp){
				hp_atual += regen
			}
			else{
				hp_atual = hp;
			}
		}
	}
}

function hp_zero(){
	if(hp_atual <= 0){
		hp_atual = 0;
		audio_play_sound(sfx_player_death, 10, false);
		state = character_state.death;
		image_index = 0;
	}	
}

function armor_up(){
	armor++;
}

function fire_rate_up(){
	fire_rate--;
}

function damage_up(qntd){
	damage += qntd;
}

function regen_up(){
	regen++;
}

function radius_up(qntd){
	collect_radius += qntd;
}
