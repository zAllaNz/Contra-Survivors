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
draw_set_font(fnt_arial);
draw_text((bar_x + bar_width /2), bar_y, string(player.hp_atual) + " / " + string(player.hp));
draw_set_font(0);

// Barra de XP
draw_set_color(c_black);
draw_rectangle(bar_x, bar_y_xp, bar_x + bar_width, bar_y_xp + bar_height_xp, false);
draw_set_color(c_blue);
var xp_ratio = player.xp / player.xp_to_levelup;
draw_rectangle(bar_x, bar_y_xp, bar_x + (bar_width * xp_ratio), bar_y_xp + bar_height_xp, false);
draw_set_color(c_white); 

// Timer
var minutos = floor(tempo_total div 60);
var segundos = floor(tempo_total mod 60);
var tempo_str = string_format(minutos, 2, 0) + ":" + string_format(segundos, 2, 0);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_font(fnt_timer);
draw_text(gui_width / 2, 20, tempo_str);
draw_set_font(0);