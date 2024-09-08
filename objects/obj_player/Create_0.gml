// Atributos do personagem
move_speed = 4;
armor = 4;
hp = 30;
fire_rate = 15;
damage = 5;

x_arma = 28;
y_arma = 9;
instance_create_layer(x+x_arma, y+y_arma,"instances", obj_teste); // Temporário (excluir)
state = character_state.idle;
time_since_last_shot = 0;
xp = 0;
level = 1;
xp_to_levelup = 30;
collect_radius = 50;
pause = false;
teste = false;


enum character_state{
	idle, walk, death
}


function move_e_colide(move_speed, move_x, move_y){
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

function speed_up(qntd){
	move_speed += qntd;
}

function hp_up(qntd){
	hp += qntd;
}

function armor_up(qntd){
	armor += qntd;
}

function fire_rate_up(qntd){
	fire_rate -= qntd;
}

function damage_up(qntd){
	damage += qntd;
}

