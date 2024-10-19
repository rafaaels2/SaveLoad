// Alterna entre as opções
if (keyboard_check_pressed (vk_up)) {
    selected_option = (selected_option - 1 + 2) mod 2
}

if (keyboard_check_pressed (vk_down)) {
    selected_option = (selected_option + 1) mod 2
}

// Confirmar seleção
if (keyboard_check_pressed (vk_enter)) {
    if (selected_option == 0) {
		ini_open("save.ini");
		
		ini_write_real ("Player","x_atual", 48)
		ini_write_real ("Player","y_atual", 112)
		
		ini_close();
		
        room_goto (1)
	}
		
    else if (selected_option == 1) {
        // Carregar Jogo
        ini_open("save.ini");
		
        saved_room = ini_read_real ("Player", "room", -1);
		
        ini_close();

        if (saved_room != -1) 
			room_goto (saved_room)
    }
}
