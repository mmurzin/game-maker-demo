/// @description Insert description here
// You can write your code in this editor
var window_width = window_get_width();
var window_height = window_get_height();

// Вывод значений на экран для отладки
//draw_text(10, 10, "Window Width: " + string(window_width));
//draw_text(10, 30, "Window Height: " + string(window_height));


if(string_length(global.clicked_button_sprite) > 0){
	draw_text(700, 400, "Clicked button: " + string(global.clicked_button_sprite));
}