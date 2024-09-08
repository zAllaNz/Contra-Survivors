var tam_spr = sprite_get_width(spr_level_up_hud);
var space = 30;
var xx = display_get_gui_width() / 2 - tam_spr - space;
var yy = display_get_gui_height() / 2;


for(var i = 0; i < 3; i++){
	draw_sprite(spr_level_up_hud, -1, xx + ((tam_spr + space) * i), yy);
}
