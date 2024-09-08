upgrade_num = 3;
tam_spr = sprite_get_width(spr_level_up_hud);
space = 30;
xx = display_get_gui_width() / 2 - tam_spr - space;
yy = display_get_gui_height() / 2;
alpha = 0.6;
upgrade_list = ds_list_create();
player = obj_player; // referenciando player
escolher = true;
tam_spr = sprite_get_width(spr_level_up_hud);
space = 30;
xx = display_get_gui_width() / 2 - tam_spr - space;
yy = display_get_gui_height() / 2;

enum upgrades{
	nome,
	scripts,
	lenght
}

dataset = ds_grid_create(upgrades.lenght, 0);
scr_ds_grid_add_upgrade("Velocidade", -1, -1);
scr_ds_grid_add_upgrade("Defesa", -1, -1);
scr_ds_grid_add_upgrade("HP", -1, -1);
scr_ds_grid_add_upgrade("Fire Rate", -1, -1);
scr_ds_grid_add_upgrade("Dano", -1, -1);



