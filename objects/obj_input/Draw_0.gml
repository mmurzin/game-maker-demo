/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
draw_set_color(c_white)

function insert_value(column_map, column_keys, key, value){
	array_push(column_keys, key)
	ds_map_add(column_map, key, value);
}

if global.selected_gamepad != -1 && ds_map_exists(global.gamepads, global.selected_gamepad){
	_window_width = display_get_width();
	_window_height = display_get_height();


	_selected_gamepad_label =  ds_map_find_value(global.gamepads, global.selected_gamepad);
	draw_text(10, 10, "Selected gamepad: " + _selected_gamepad_label)
	
	

	if (keyboard_check_pressed(vk_lalt)) {
		var _keys = ds_map_keys_to_array(global.gamepads)
		var _current_index = -1
		var _next_index = -1
		var _keys_length = array_length(_keys)
		var _last_index = _keys_length - 1
		for (var _i = 0; _i < _keys_length; _i++){
			if array_get(_keys, _i) == global.selected_gamepad{
				_current_index = _i
			}
			if _current_index != - 1 && (_current_index + 1) > _last_index{
				_next_index = 0
			}
			if _current_index != - 1 && (_current_index + 1) <= _last_index{
				_next_index = _current_index + 1
			}
		}
		if _next_index != -1 {
			global.selected_gamepad = array_get(_keys, _next_index)
		}
	}
	
	if (keyboard_check_pressed(vk_lcontrol)) {
	    var _keys = ds_map_keys_to_array(global.gamepads)
		var _current_index = -1
		var _prev_index = -1
		var _keys_length = array_length(_keys)
		var _last_index = _keys_length - 1
		for (var _i = 0; _i < _keys_length; _i++){
			if array_get(_keys, _i) == global.selected_gamepad{
				_current_index = _i
			}
			if _current_index != - 1 && (_current_index - 1) < 0{
				_prev_index = _last_index
			}
			if _current_index != - 1 && (_current_index - 1) >= 0{
				_prev_index = _current_index - 1
			}
		}
		if _prev_index != -1 {
			global.selected_gamepad = array_get(_keys, _prev_index)
		}
	}
	draw_text(10, 40, "Gamepad Buttons")
	
	var _y = 70;
	var _x = 10;
	var _cell_width = 400;
	var _cell_height = 20;

	var _column_buttons = ds_map_create()
	var _keys_column_buttons = array_create(0);
	insert_value(_column_buttons, _keys_column_buttons, "gp_face1", gp_face1)
	insert_value(_column_buttons, _keys_column_buttons, "gp_face2", gp_face2)
	insert_value(_column_buttons, _keys_column_buttons, "gp_face3", gp_face3)
	insert_value(_column_buttons, _keys_column_buttons, "gp_face4", gp_face4)
	
	insert_value(_column_buttons, _keys_column_buttons, "gp_shoulderl", gp_shoulderl)
	insert_value(_column_buttons, _keys_column_buttons, "gp_shoulderlb", gp_shoulderlb)
	insert_value(_column_buttons, _keys_column_buttons, "gp_shoulderr", gp_shoulderr)
	insert_value(_column_buttons, _keys_column_buttons, "gp_shoulderrb", gp_shoulderrb)
	insert_value(_column_buttons, _keys_column_buttons, "gp_stickl", gp_stickl)
	insert_value(_column_buttons, _keys_column_buttons, "gp_stickr", gp_stickr)
	insert_value(_column_buttons, _keys_column_buttons, "gp_padu", gp_padu)
	insert_value(_column_buttons, _keys_column_buttons, "gp_padd", gp_padd)
	insert_value(_column_buttons, _keys_column_buttons, "gp_padl", gp_padl)
	insert_value(_column_buttons, _keys_column_buttons, "gp_padr", gp_padr)
	
	for(var _i = 0; _i < array_length(_keys_column_buttons); _i++){
		var key = array_get(_keys_column_buttons, _i)
	    var value = ds_map_find_value(_column_buttons, key);
	    draw_text(_x, _y, key + ":" +string(gamepad_button_check(global.selected_gamepad, value)))
		_y = _y + _cell_height
	}
	
	_y = _y + _cell_height
	draw_text(10, _y, "Gamepad Axis")
	_y = _y + _cell_height*2
	var _column_axis = ds_map_create()
	var _keys_column_axis = array_create(0);
	insert_value(_column_axis, _keys_column_axis, "gp_axislh", gp_axislh)
	insert_value(_column_axis, _keys_column_axis, "gp_axislv", gp_axislv)
	insert_value(_column_axis, _keys_column_axis, "gp_axisrh", gp_axisrh)
	insert_value(_column_axis, _keys_column_axis, "gp_axisrv", gp_axisrv)
	
	
	for(var _i = 0; _i < array_length(_keys_column_axis); _i++){
		var key = array_get(_keys_column_axis, _i)
	    var value = ds_map_find_value(_column_axis, key);
	    draw_text(_x, _y, key + ":" +string(gamepad_axis_value(global.selected_gamepad, value)))
		_y = _y + _cell_height
	}
	_x = _x+_cell_width
	draw_text(_x, 40, "DualSense gamepad on a PS4 or PS5")
	_y = 70;
	var _column_ps_axis = ds_map_create()
	var _keys_column_ps_axis = array_create(0);
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_acceleration_x", gp_axis_acceleration_x)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_acceleration_y", gp_axis_acceleration_y)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_acceleration_z", gp_axis_acceleration_z)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_angular_velocity_x", gp_axis_angular_velocity_x)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_angular_velocity_y", gp_axis_angular_velocity_y)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_angular_velocity_z", gp_axis_angular_velocity_z)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_orientation_x", gp_axis_orientation_x)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_orientation_y", gp_axis_orientation_y)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_orientation_z", gp_axis_orientation_z)
	insert_value(_column_ps_axis, _keys_column_ps_axis, "gp_axis_orientation_w", gp_axis_orientation_w)
	
	
	for(var _i = 0; _i < array_length(_keys_column_ps_axis); _i++){
		var key = array_get(_keys_column_ps_axis, _i)
	    var value = ds_map_find_value(_column_ps_axis, key);
	    draw_text(_x, _y, key + ":" +string(gamepad_axis_value(global.selected_gamepad, value)))
		_y = _y + _cell_height
	}
}









