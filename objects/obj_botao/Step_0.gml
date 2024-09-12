var click = device_mouse_check_button(0, mb_left);
if(position_meeting(mouse_x, mouse_y, id)){
	if(click){
		audio_play_sound(sfx_select, 10, false);
		if(texto == "SAIR"){
			game_end();
		}
		room_goto(room_go);
	}
}