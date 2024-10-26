// define o tamanho da janela
window_set_size (1280, 720)

// Dimensões do monitor
monitor_width = display_get_width ();
monitor_height = display_get_height ();

// Dimensões da janela do jogo
window_width = window_get_width ();
window_height = window_get_height ();

// Calcula a posição para centralizar a janela
window_x = (monitor_width - window_width) / 2;
window_y = (monitor_height - window_height) / 2;

// Define a posição da janela no centro do monitor
window_set_position (window_x, window_y);

// 0 = Novo Jogo, 1 = Carregar Jogo
selected_option = 0;  

