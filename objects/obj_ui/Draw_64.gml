if(player.pause){
	exit;
}

draw_sprite(mugshot, 0, 5, 5);
// Barra de HP
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);
draw_set_color(c_red);
var hp_ratio = player.hp_atual / player.hp;
draw_rectangle(bar_x, bar_y, bar_x + (bar_width * hp_ratio), bar_y + bar_height, false);
draw_set_color(c_white);
draw_text((bar_x + bar_width /2.5), bar_y+10, string(player.hp_atual) + " / " + string(player.hp));

// Barra de XP
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y_xp, bar_x + bar_width, bar_y_xp + bar_height_xp, false);
draw_set_color(c_blue);
var xp_ratio = player.xp / player.xp_to_levelup;
draw_rectangle(bar_x, bar_y_xp, bar_x + (bar_width * xp_ratio), bar_y_xp + bar_height_xp, false);
draw_set_color(c_white); 