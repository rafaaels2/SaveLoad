y_speed += 0.1
x_speed = 0

if keyboard_check (vk_left) {
	x_speed =- 1
}

if keyboard_check (vk_right) {
	x_speed =+ 1
}

if place_meeting (x, y + 1, oSolid) {
	y_speed = 0
	
	if keyboard_check (vk_up) {
		y_speed =- 2	
	}
}

move_and_collide (x_speed, y_speed, oSolid)

if place_meeting (x, y, oFlag) {
	// salvamento
	
	// deleta o save anterior
	if (file_exists ("save.ini"))
		file_delete ("save.ini")
		
	ini_open ("save.ini")
	
	// verifica se eh a ultima sala
	if (room_next (room) == -1) {
		show_message("Você completou o jogo!")
		room_goto (0)
		
		ini_write_real ("Player","room", 0)
		
		ini_close ()
	}
	
	else {
		// inicio da fase
		ini_write_real ("Player","x_atual", 48)
		ini_write_real ("Player","y_atual", 112)
		ini_write_real ("Player","room", real (room_next (room)))
		ini_write_real ("Player","nivel", ++nivel)
		
		pontos += 10
		
		ini_write_real ("Player","pontos", pontos)
		
		ini_close ()
		
		show_message("Vida: " + string(vida) + "\nPontos: " + string(pontos) + "\nNível: " + string(nivel));
		
		room_goto_next ()
	}
}

if place_meeting (x, y, oSpike) {
	if (file_exists ("save.ini"))
		file_delete ("save.ini")
		
	ini_open ("save.ini")
	
	vida -= 10
	
	if (vida == 0) {
		vida = 100	
		room_restart ()
	}
	
	ini_close ()
}