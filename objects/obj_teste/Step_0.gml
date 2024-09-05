// Calcula a posição da ponta da arma com base na rotação do player
x = obj_player.x + lengthdir_x(obj_player.x_arma, obj_player.image_angle) - lengthdir_y(obj_player.y_arma, obj_player.image_angle);
y = obj_player.y + lengthdir_y(obj_player.x_arma, obj_player.image_angle) + lengthdir_x(obj_player.y_arma, obj_player.image_angle);
image_angle = point_direction(x, y, mouse_x, mouse_y);