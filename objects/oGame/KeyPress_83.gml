// deleta o save anterior
if (file_exists ("save.ini"))
	file_delete ("save.ini")
		
ini_open ("save.ini")

ini_write_real ("Player","x_atual", oPlayer.x)
ini_write_real ("Player","y_atual", oPlayer.y)
ini_write_real ("Player","room", real (room))
		
ini_close ()
		
show_message("Arquivo salvo!")