/// @description Insert description here
// You can write your code in this editor
is_focused = false;

function on_click(){
	var sprite_name = sprite_get_name(sprite_index);
	clicked_sprite = sprite_name
	show_debug_message("on_click called " + sprite_name);
	global.clicked_button_sprite = sprite_name;
}