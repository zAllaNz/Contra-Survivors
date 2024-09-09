if(!player.pause){
	exit;
}

draw_set_alpha(0.5);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

var mouse_xx = device_mouse_x_to_gui(0);
var mouse_yy = device_mouse_y_to_gui(0);

for(var i = 0; i < upgrade_num; i++){
	var spr_xx = xx + ((tam_spr + space) * i);
	var item = upgrade_list[| i];
	if(point_in_rectangle(mouse_xx, mouse_yy, spr_xx - tam_spr/2, yy - tam_spr/2,
		spr_xx + tam_spr/2, yy + tam_spr/2)){
		alpha = 1;
		draw_text(mouse_xx, mouse_yy, "oi");
		if(mouse_check_button_pressed(mb_left)){
			escolher = true;
			var aux = ds_grid_get(dataset, upgrades.scripts, item);
			aux();
			scr_switch_pause();
		}
	}
	else{
		alpha = 0.6;
	}
	draw_sprite_ext(spr_level_up_hud, -1, spr_xx, yy, 1, 1, 0, c_white, alpha);
	draw_sprite(spr_upgrade_sheet, item, spr_xx-98, yy-72);
	draw_set_font(fnt_pixel);
	draw_set_halign(fa_center);
	draw_text(spr_xx+30, yy-75, dataset[# upgrades.nome, item]);
	draw_set_font(-1);
	draw_text(spr_xx, yy, dataset[# upgrades.descricao, item]);
}












