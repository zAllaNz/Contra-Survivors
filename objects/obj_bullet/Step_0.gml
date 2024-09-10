if(player.pause){
	exit;
}
move_bullet();
collision_wall_bullet();
destroy_outside_bullet(x, y);
