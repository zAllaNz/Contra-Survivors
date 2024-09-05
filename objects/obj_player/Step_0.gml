
// Captura o movimento do jogador
var move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var click = mouse_check_button_pressed(mb_left);

// Interpolar o ângulo
image_angle = point_direction(x, y, mouse_x, mouse_y);
move_e_colide(move_speed, move_x, move_y);
var ponta_arma_x = x + lengthdir_x(x_arma, image_angle) - lengthdir_y(y_arma, image_angle);
var ponta_arma_y = y + lengthdir_y(x_arma, image_angle) + lengthdir_x(y_arma, image_angle);

if(click){
	instance_create_layer(ponta_arma_x, ponta_arma_y, "instances", obj_gun);
}

