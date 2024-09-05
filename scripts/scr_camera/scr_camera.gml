// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_outside_camera(aux_x, aux_y){
	if(aux_x < global.cam_x or aux_x > global.cam_x + global.cam_width or aux_y < global.cam_y 
	or aux_y > global.cam_y + global.cam_height){
		return true;
	}
}