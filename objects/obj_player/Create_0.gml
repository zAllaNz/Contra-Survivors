move_speed = 4;
x_arma = 28;
y_arma = 9;
instance_create_layer(x+x_arma, y+y_arma,"instances", obj_teste);

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