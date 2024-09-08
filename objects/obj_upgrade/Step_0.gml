randomize();
if(escolher){
	upgrade_list = ds_list_create();
	for(var i = 0; i < upgrade_num; i++){
		var up = irandom(ds_grid_height(dataset) - 1);
		while(ds_list_find_index(upgrade_list, up) != -1){
			up = irandom(ds_grid_height(dataset) - 1);
		}
		ds_list_add(upgrade_list, up);
		show_debug_message(upgrade_list[| i]);
	}
	escolher = false;
}











