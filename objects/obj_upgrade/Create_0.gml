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
	descricao,
	lenght
}

var speed_up_function = function() {
    player.speed_up();
};

var armor_function = function() {
    player.armor_up();
};

var hp_function = function() {
    player.hp_up();
};

var fire_rate_function = function() {
    player.fire_rate_up();
};

var damage_function = function() {
    player.damage_up(3);
};

var radius_function = function() {
    player.radius_up(25);
};


var regen_function = function() {
    player.regen_up();
};

dataset = ds_grid_create(upgrades.lenght, 0);
scr_ds_grid_add_upgrade("SPEED", speed_up_function, "Aumenta a velocidade base\n em 12.5%");
scr_ds_grid_add_upgrade("DEFENCE", armor_function, "Aumenta a defesa base\n em 1");
scr_ds_grid_add_upgrade("HP", hp_function, "Aumenta em 5 a vida maxima");
scr_ds_grid_add_upgrade("FIRE RATE", fire_rate_function, "Aumenta a velocidade de tiro\n em 1");
scr_ds_grid_add_upgrade("DAMAGE", damage_function, "Aumenta o dano base\n em 3");
scr_ds_grid_add_upgrade("REGENERACAO", regen_function, "Aumenta a regeneração base\n em 1");
scr_ds_grid_add_upgrade("RAIO DE COLETA", radius_function, "Aumenta o raio de coleta\n em 25");


