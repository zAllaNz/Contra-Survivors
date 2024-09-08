function scr_outside_camera(aux_x, aux_y){
	if(aux_x < global.cam_x or aux_x > global.cam_x + global.cam_width or aux_y < global.cam_y 
	or aux_y > global.cam_y + global.cam_height){
		return true;
	}
}

function scr_switch_pause(){
	if(obj_player.pause){
		obj_player.pause = false;
	}
	else{
		obj_player.pause = true;
	}
}
