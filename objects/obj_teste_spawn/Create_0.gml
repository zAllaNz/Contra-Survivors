enemy = [obj_ant, obj_soldier, obj_bug, obj_ant_red];
random_enemy = 0;
level = obj_player.level;

if(level == 2){
	random_enemy = 1;
}
else if(level == 5){
	random_enemy = 2;
}
else if(level == 8){
	random_enemy = 3;
}