/// @description Вставьте описание здесь
// Вы можете записать свой код в этом редакторе
//instance_deactivate_object(obj_controller);
globalvar Direction;
Direction = {
    Left: 0,
    Right: 1,
    Up: 2,
    Down: 3
};

persistent = true;
global.selected_gamepad = -1
global.gamepads = ds_map_create();
alarm_keyboard_speed = 1//game_get_speed(gamespeed_fps)/15;
alarm[0] = alarm_keyboard_speed;

grid_width = 100; 
grid_height = 100;
min_gap = 32;
objects_grid = ds_grid_create(grid_width, grid_height);
buttons_grid = ds_grid_create(grid_width, grid_height);

current_x = -1;
current_y = -1;

//contorller values
prev_lh = 0
prev_lv = 0
contorller_threshold = 0.5;

long_timer_delay = 30
//conroller long timers
long_right_timer = 0
long_left_timer = 0
long_down_timer = 0
long_up_timer = 0

function handle_click(){
	if(current_x == -1 && current_y == -1){
		return
	}
	var button = ds_grid_get(buttons_grid, current_x, current_y)
	button.on_click();
}


function handle_action(action){
	if(action == undefined){
		return
	}
	var max_x = ds_grid_width(buttons_grid) - 1;
	var max_y = ds_grid_height(buttons_grid) - 1;
	
	if(current_x == -1 && current_y == -1){
		current_x = 0
		current_y = 0
		update_button_position(current_x, current_y)
		return 
	}
	clear_prev_focus(current_x, current_y)
	if(action == Direction.Up){
		var new_y = current_y + 1
		if(new_y > max_y){
			current_y = 0
		} else {
			current_y = new_y
		}
	} else if (action == Direction.Down) {
		var new_y = current_y - 1
		if(new_y < 0){
			current_y = max_y
		} else {
			current_y = new_y
		}
	} else if (action == Direction.Left) {
		var new_x = current_x - 1
		if(new_x < 0){
			current_x = max_x
		} else {
			current_x = new_x
		}
	}  else if (action == Direction.Right) {
		var new_x = current_x + 1
		if(new_x > max_x ){
			current_x = 0
		} else {
			current_x = new_x
		}
	}
	update_button_position(current_x, current_y)
}

function update_button_position(x, y){
	var button = ds_grid_get(buttons_grid, x, y)
	button.is_focused = true
	
}

function clear_prev_focus(x, y) {
	var button = ds_grid_get(buttons_grid, x, y)
	button.is_focused = false
}

function add_button(button){
    var obj_x = button.x;
    var obj_y = button.y;
    
    var grid_x = clamp(floor(obj_x / min_gap), 0, grid_width - 1); 
    var grid_y = clamp(floor(obj_y / min_gap), 0, grid_height - 1); 
	//show_debug_message("__dump__");
	//show_debug_message("grid_x " + string(grid_x));
	//show_debug_message("grid_y "+string(grid_y));
	//show_debug_message("_______");
    objects_grid[# grid_x, grid_y] = button;
	_recalculate_button_grid();
}
function _get_objects_height(){
	var original_widht = ds_grid_width(objects_grid);
	var original_height = ds_grid_height(objects_grid);
	var max_row_count = 0
	for(var row_index=0;row_index<original_height;row_index++){
		var current_row_count = 0;
		for(var col_index=0; col_index<original_height; col_index++){
			if(ds_grid_get(objects_grid, row_index, col_index) != 0){
				current_row_count++
				//show_debug_message("object found row_index "+string(row_index) + " col_index "+string(col_index));
			}
		}
		if(current_row_count > max_row_count){
			max_row_count = current_row_count;
		}
	}
	return max_row_count
}

function _get_objects_width(){
	var original_widht = ds_grid_width(objects_grid);
	var original_height = ds_grid_height(objects_grid);
	
	var max_column_count = 0;
	for(var col_index=0;col_index<original_widht;col_index++){
		var current_column_count = 0;
		for(var row_index=0; row_index<original_height; row_index++){
			if(ds_grid_get(objects_grid, row_index, col_index) != 0){
				current_column_count++
				//show_debug_message("object found row_index "+string(row_index) + " col_index "+string(col_index));
			}
		}
		if(current_column_count > max_column_count){
			max_column_count = current_column_count;
		}
	}
	return max_column_count;
}

function _recalculate_button_grid(){
	var objects_width = _get_objects_width();
	var objects_height= _get_objects_height();
	//show_debug_message("objects_width "+string(objects_width) +" objects_height "+string(objects_height));
	buttons_grid = ds_grid_create(objects_width, objects_height);
	
	var buttons_i = 0;
	var buttons_j = 0;
	for (var i = 0; i < ds_grid_width(objects_grid); i++) {
		var include_element = false
		buttons_j = 0
	    for (var j = 0; j < ds_grid_height(objects_grid); j++) {
	        if (ds_grid_get(objects_grid, i, j) != 0) {
				show_debug_message("insert item i "+string(buttons_i) +" buttons_j "+string(buttons_j))
				ds_grid_set(buttons_grid, buttons_i, buttons_j, ds_grid_get(objects_grid, i, j));
				include_element = true
				buttons_j++
	        }
	    }
		if(include_element){
			buttons_i++
		}
	}
	show_debug_message("ds_grid_width " + string(ds_grid_width(buttons_grid)))
	show_debug_message("ds_grid_height " + string(ds_grid_height(buttons_grid)))
}
min_axis_value = 0.09


