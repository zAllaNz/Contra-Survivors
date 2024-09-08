function scr_ds_grid_add_row(){
	var grid = argument[0];
	ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)+1);
	return(ds_grid_height(grid)-1);	
}
 
function scr_ds_grid_add_upgrade(name, funcao, frequency){
	var grid = dataset;
	var _y = scr_ds_grid_add_row(grid);
 
	grid[# 0, _y] = name;
	grid[# 1, _y] = funcao;
	grid[# 2, _y] = frequency;
}