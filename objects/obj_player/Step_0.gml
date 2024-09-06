// Captura o movimento do jogador
var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var click = mouse_check_button(mb_left);

image_angle = point_direction(x, y, mouse_x, mouse_y);
move_e_colide(move_speed, move_x, move_y);
var ponta_arma_x = x + lengthdir_x(x_arma, image_angle) - lengthdir_y(y_arma, image_angle);
var ponta_arma_y = y + lengthdir_y(x_arma, image_angle) + lengthdir_x(y_arma, image_angle);

time_since_last_shot++;

var target = collision_circle(x, y, collect_radius, obj_coletavel, false, false);
if(target != noone){
	target.move = true;
}

if(click){
	if(time_since_last_shot >= fire_rate){
		instance_create_layer(ponta_arma_x, ponta_arma_y, "instances", obj_gun);
		time_since_last_shot = 0;
	}
}

show_debug_message(xp_to_levelup);
show_debug_message(level);

switch state{
	case character_state.idle:
		sprite_index = spr_player_idle;
		
		if(move_x != 0 or move_y != 0){
			state = character_state.walk;	
		}
	break
	
	case character_state.walk:
		sprite_index = spr_player_walk;
		
		if(move_x == 0 and move_y == 0){
			state = character_state.idle;	
		}
	break
}