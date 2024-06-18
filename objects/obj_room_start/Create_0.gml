/// @description Insert description here
// You can write your code in this editor
var button_sprites = [sprite_devil, sprite_freeze, sprite_robot, sprite_shocked, sprite_sunglasses, sprite_winking]
var row_count = 2
var items_in_row = array_length(button_sprites)/row_count

var button_sprite_index = 0
var margin = 50

var button_size = 128;
var buttons_controller = instance_find(obj_controller, 0);

for(i = 0; i<row_count; i++){
	//0, 1, 2
	//3, 4, 5
	var row = i+1;
	for (j=0;j<items_in_row; j++){
		var column = j+1;
		var new_button = instance_create_layer(margin + j * (button_size+margin), margin + i * (button_size+margin), "Instances", obj_button);
		new_button.sprite_index = button_sprites[button_sprite_index];
		new_button.image_xscale = button_size / sprite_get_width(new_button.sprite_index);
		new_button.image_yscale = button_size / sprite_get_height(new_button.sprite_index);
		if(buttons_controller != noone){
			buttons_controller.add_button(new_button);
		}
		button_sprite_index++;
	}
}
