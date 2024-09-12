if (tempo_total > 0) {
    tempo_total -= 1 / room_speed;
}
if (tempo_total <= 0) {
    room_goto(rm_win_screen);
}